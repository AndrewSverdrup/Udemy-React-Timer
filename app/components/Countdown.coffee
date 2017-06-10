React = require 'react'

Clock = require 'Clock'
CountdownForm = require 'CountdownForm'

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
               clearInterval(@timer)
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
   render: ->
      {count} = @state
      div {},
         React.createElement Clock, {totalSeconds:count}, null
         React.createElement CountdownForm, {onSetCountdown: @handleSetCountdown}, null

module.exports = Countdown
