React = require 'react'
ReactDOM = require 'react-dom'
expect = require 'expect'
$ = require 'jQuery'
TestUtils = require 'react-addons-test-utils'

Clock = require 'Clock'

describe 'Clock', ->
   it 'should exist', ->
      expect(Clock).toExist()

   describe 'render', ->
      it 'should render clock to output', ->
         clock = TestUtils.renderIntoDocument React.createElement Clock,{totalSeconds: 62},null
         $el = $(ReactDOM.findDOMNode clock) # findDOMNode converts component to actual html that is rendered in browser.  Now $el can make any jQuery call
         actualText= $el.find('.clock-text').text()
         expect(actualText).toBe '01:02'

   # when testing individual methods with more than one test, good idea to use a separate describe
   describe 'formatSeconds', ->
      it 'should format seconds', ->
         clock = TestUtils.renderIntoDocument React.createElement Clock,{},null
         seconds = 615
         expected = '10:15'
         actual = clock.formatSeconds seconds
         expect(actual).toBe expected
      it 'should format seconds when min/sec are less than 10', ->
         clock = TestUtils.renderIntoDocument React.createElement Clock,{},null
         seconds = 61
         expected = '01:01'
         actual = clock.formatSeconds seconds
         expect(actual).toBe expected
