React = require 'react'
ReactDOM = require 'react-dom'
expect = require 'expect'
$ = require 'jQuery'
TestUtils = require 'react-addons-test-utils'

Timer = require 'Timer'

describe 'Timer', ->
   timer = null

   beforeEach(()=>
      timer = TestUtils.renderIntoDocument React.createElement Timer, {}, null
   )

   it 'should exist', ->
      expect(Timer).toExist()

   describe 'initial render', ->
      it 'should begin at 0 seconds', ->
         expect(timer.state.count).toBe 0
      it 'should begin in \'stopped\' state', ->
         expect(timer.state.timerStatus).toBe 'stopped'

   describe 'handleStatusChange', ->
      it 'should count up when started', (done) ->
         timer.handleStatusChange 'started'
         expect(timer.state.timerStatus).toBe 'started'
         expect(timer.state.count).toBe 0
         setTimeout(
            () =>
               expect(timer.state.count).toBe 2
               done()
            2001
         )
      it 'should pause count when paused', (done) ->
         timer.setState
            count: 5
         timer.handleStatusChange 'started'
         timer.handleStatusChange 'paused'

         setTimeout(
            () =>
               expect(timer.state.timerStatus).toBe 'paused'
               expect(timer.state.count).toBe 5
               done()
            1001
         )

       it 'should reset timer when cleared', (done) ->
         timer.setState
            count: 5
         timer.handleStatusChange 'started'
         timer.handleStatusChange 'stopped'
         setTimeout(
            () =>
               expect(timer.state.timerStatus).toBe 'stopped'
               expect(timer.state.count).toBe 0
               done()
            1001
         )
