React = require 'react'
ReactDOM = require 'react-dom'
expect = require 'expect'
$ = require 'jQuery'
TestUtils = require 'react-addons-test-utils'

CountdownForm = require 'CountdownForm'

describe 'CountdownForm', ->
   it 'should exist', ->
      expect(CountdownForm).toExist()
   it 'should call onSetCountdown if valid seconds entered', ->
      spy = expect.createSpy()
      countdownForm = TestUtils.renderIntoDocument(
         React.createElement CountdownForm, {onSetCountdown: spy}, null
      )
      $el = $(ReactDOM.findDOMNode countdownForm)
      countdownForm.refs.seconds.value = '109'
      TestUtils.Simulate.submit $el.find('form')[0] #find lets us look for child dom elements. then get first element, which is the form??
      expect(spy).toHaveBeenCalledWith(109)

   it 'should not call onSetCountdown if invalid seconds entered', ->
      spy = expect.createSpy()
      countdownForm = TestUtils.renderIntoDocument(
         React.createElement CountdownForm, {onSetCountdown: spy}, null
      )
      $el = $(ReactDOM.findDOMNode countdownForm)
      countdownForm.refs.seconds.value = '109b'
      TestUtils.Simulate.submit $el.find('form')[0]
      expect(spy).toNotHaveBeenCalled()
