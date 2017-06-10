React = require 'react'
ReactDOM = require 'react-dom'
expect = require 'expect'
$ = require 'jQuery'
TestUtils = require 'react-addons-test-utils'

Controls = require 'Controls'

describe 'Controls', ->
  it 'should exist', ->
     expect(Controls).toExist()

   describe 'render', ->
      it 'should render \'Pause\' when started', ->
         controls = TestUtils.renderIntoDocument <Controls countdownStatus='started'/>
         $el = $(ReactDOM.findDOMNode controls)
         $pauseButton = $el.find 'button:contains(Pause)' #Look for a button whose text value is pause
         expect($pauseButton.length).toBe 1 # It should have found 1 button that says 'Pause'

      it 'should render \'Start\' when paused', ->
         controls = TestUtils.renderIntoDocument <Controls countdownStatus='paused'/>
         $el = $(ReactDOM.findDOMNode controls)
         $startButton = $el.find 'button:contains(Start)' #Look for a button whose text value is pause
         expect($startButton.length).toBe 1
