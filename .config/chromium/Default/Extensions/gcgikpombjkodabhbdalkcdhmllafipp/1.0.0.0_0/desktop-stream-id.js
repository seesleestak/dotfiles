
// Object constructor to get a streamId for desktop capture

function DesktopStreamId() {}

DesktopStreamId.prototype.start = function(tab) {

    var self = this;

	// Ask user for access to the desktop or an application window
    return new Promise(function(resolve, reject) {

        self.reject = reject;

        self.desktopMediaRequestId = chrome.desktopCapture.chooseDesktopMedia(
            ["screen", "window"],
            tab,
            function(streamId) {

                // Chooser will have been dismissed at this point so we can't cancel it any more
                self.desktopMediaRequestId = null;
                if (streamId) {
                    resolve(streamId);
                } else {
                    var lastError = chrome.runtime.lastError && chrome.runtime.lastError.message;
                    reject(lastError || 'Chooser canceled by user ');
                }
            }
        );
    });
};

DesktopStreamId.prototype.shutdown = function() {
	
	if (this.desktopMediaRequestId) {
		chrome.desktopCapture.cancelChooseDesktopMedia(this.desktopMediaRequestId);
		this.desktopMediaRequestId = null;
		this.reject('Chooser canceled by API');
	}
};