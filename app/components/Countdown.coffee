React = require 'react'

Clock = require 'Clock'
CountdownForm = require 'CountdownForm'
Controls = require 'Controls'

{h3, div} = React.DOM

Countdown = React.createClass
   getInitialState: ->
      count: 0
      countdownStatus: 'stopped'
   componentDidUpdate: (prevProps, prevState) ->
      if @state.countdownStatus isnt prevState.countdownStatus
         switch @state.countdownStatus
            when 'started'
               @startTimer()
            when 'stopped'
               @setState
                  count: 0
               clearInterval(@timer)
               @timer = undefined
            when 'paused'
               clearInterval(@timer)
               @timer = undefined
   startTimer: ->
      @timer = setInterval(
         () =>
            newCount = if --@state.count >= 0 then @state.count else 0
            if newCount is 0
               @setState
                  count: newCount
                  countdownStatus: 'stopped'
            else
               @setState
                  count: newCount
         1000
      )
   handleSetCountdown: (seconds) ->
      @setState
         count: seconds
         countdownStatus: 'started'
   handleStatusChange: (newStatus) ->
      @setState
         countdownStatus: newStatus
   render: ->
      {count, countdownStatus} = @state
      renderControlArea = () =>
         if countdownStatus isnt 'stopped'
            React.createElement(
               Controls, {countdownStatus: countdownStatus, onStatusChange: @handleStatusChange}, null
            )
         else
            React.createElement CountdownForm, {onSetCountdown: @handleSetCountdown}, null

      div {},
         React.createElement Clock, {totalSeconds:count}, null
         renderControlArea()


module.exports = Countdown
