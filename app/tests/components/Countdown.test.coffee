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

      it 'should pause countdown on paused status', (done) ->
         countdown = TestUtils.renderIntoDocument React.createElement Countdown, {}, null
         countdown.handleSetCountdown 3
         countdown.handleStatusChange 'paused'

         setTimeout(
            () ->
            expect(countdown.state.count).toBe 3
            expect(countdown.state.countdownStatus).toBe 'paused'
            done()
            1001
         )

      it 'should reset count on stopped status', (done) ->
         countdown = TestUtils.renderIntoDocument React.createElement Countdown, {}, null
         countdown.handleSetCountdown 3
         countdown.handleStatusChange 'stopped'

         setTimeout(
            () ->
            expect(countdown.state.count).toBe 0
            expect(countdown.state.countdownStatus).toBe 'stopped'
            done()
            1001
         )
