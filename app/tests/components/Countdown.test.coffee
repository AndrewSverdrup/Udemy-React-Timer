React = require 'react'
ReactDOM = require 'react-dom'
expect = require 'expect'
$ = require 'jQuery'
TestUtils = require 'react-addons-test-utils'

Countdown = require 'Countdown'

describe 'Countdown', ->
   it 'should exist', ->
      expect(Countdown).toExist()

   describe 'handleSetCountdown', ->
      it 'should set state to started and countdown', (done) -> #done needed for async test with setTimeout
         countdown = TestUtils.renderIntoDocument(React.createElement(Countdown,{},null))
         countdown.handleSetCountdown(10)
         expect(countdown.state.count).toBe 10
         expect(countdown.state.countdownStatus).toBe 'started'

         setTimeout(
            () ->
               expect(countdown.state.count).toBe 9
               done()
            1001
         )

      it 'should not set count to a negative number', (done) ->
         countdown = TestUtils.renderIntoDocument React.createElement Countdown, {}, null
         countdown.handleSetCountdown 1

         setTimeout(
            () ->
               expect(countdown.state.count).toBe 0
               done()
            3001
         )
