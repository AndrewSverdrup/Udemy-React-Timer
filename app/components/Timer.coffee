React = require 'react'

Clock = require 'Clock'
Controls = require 'Controls'

{h1, div} = React.DOM

Timer = React.createClass
   getInitialState: ->
      timerStatus: 'stopped'
      count: 0
   componentDidUpdate: (prevProps, prevState) ->
      if @state.timerStatus isnt prevState.timerStatus
         switch @state.timerStatus
            when 'started'
               @startTimer()
            when 'stopped'
               @setState
                  count: 0
               clearInterval @timer
               @timer = undefined
            when 'paused'
               clearInterval @timer
               @timer = undefined
   componentWillUnmount: ->
      clearInterval @timer
      @timer = undefined
   startTimer: ->
      @timer = setInterval(
         () =>
            @setState
               count: ++@state.count
         1000
      )
   handleStatusChange: (newStatus) ->
      @setState
         timerStatus: newStatus
   render: ->
      {count, timerStatus} = @state

      div {},
         h1
            className: 'page-title'
            'Timer App'
         React.createElement Clock, {totalSeconds: count}, null
         React.createElement Controls, {countdownStatus: timerStatus, onStatusChange: @handleStatusChange}, null

module.exports = Timer
