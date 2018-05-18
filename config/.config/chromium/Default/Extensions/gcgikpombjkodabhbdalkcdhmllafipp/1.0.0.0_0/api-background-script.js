
// One copy of this runs for the extension

var pendingStreamRequests = {};
var extensionVersion = chrome.runtime.getManifest().version;

chrome.runtime.onMessageExternal.addListener(

    function(request, sender, sendResponse) {

        console.log('\nReq:', request);

        var self = this;

        var sendRsp = function(rsp) {
            console.log('Resp:', rsp);
            sendResponse(rsp);
        };

        var sendAck = function(streamId) {
            sendRsp({   version: extensionVersion,
                        success: true,
                        streamId: streamId,
                        counter: request.counter
            });
        };

        var sendNack = function(reason) {
            sendRsp({   version: extensionVersion,
                        success: false,
                        reason: reason,
                        counter: request.counter
            });
        };

        if (request.ping) {
            sendAck();
        } else if (typeof request.getStreamId !== 'undefined'){
            var tab = sender.tab;
            var tabId = tab.id;

            var streamRequestResult = function(success, info) {
                delete pendingStreamRequests[tabId];
                (success ? sendAck : sendNack)(info);
            };

            var pendingRequest = pendingStreamRequests[tabId];
            var havePendingRequest = !!pendingRequest;
            var needPendingRequest = !(request.getStreamId);

            if (needPendingRequest !== havePendingRequest) {
                sendNack('Invalid state: request pending='+havePendingRequest);
            } else if (request.getStreamId) {
                var streamRequest = new DesktopStreamId();
                pendingStreamRequests[tabId] = streamRequest;
                streamRequest.start(tab).then(
                    streamRequestResult.bind(this, true),
                    streamRequestResult.bind(this, false)
                );

                return true; // Make sure sendResponse() stays usable for later when .start() promise resolves
            } else {
                // Cancel pending request
                pendingRequest.shutdown();
                streamRequestResult(true, '');
            }
        } else {
            sendNack('Unknown request');
        }
    }
);