#!/bin/bash
createIndex() {
echo "import * as _actions from './actions'
import * as _constants from './constants'
import _reducer from './reducer'
import * as _selectors from './selectors'
import * as actionTypes from './actionTypes'

export const actions = _actions
export const constants = _constants
export const reducer = _reducer
export const selectors = _selectors

export default {
  actions,
  actionTypes,
  constants,
  reducer,
  selectors,
}" > ./index.js
}

createReducer() {
echo "import { createReducer } from 'utils/redux-utils'
import t from './actionTypes'

const initialState = {}

export default createReducer(initialState, {})" > ./reducer.js
}

createActions() {
echo "import t from './actionTypes'

export const testAction = (payload) => ({
  type: t.TEST_ACTION,
  payload,
})" > ./actions.js
}

createActionTypes() {
echo "import { namespaceActions } from 'utils/redux-utils'
import { NAME } from './constants'

const TEST_ACTION = 'TEST_ACTION'

export default namespaceActions(NAME)([
  TEST_ACTION,
])" > ./actionTypes.js
}

createConstants() {
echo "export const NAME = 'test'" > ./constants.js
}

createSelectors() {
  echo "import { createSelector } from 'reselect'
import { NAME } from './constants'

export const testSelector = createSelector(
  (state) => state[NAME],
  (test) => test
)" > ./selectors.js
}

createSelectors
createConstants
createActionTypes
createActions
createReducer
createIndex
