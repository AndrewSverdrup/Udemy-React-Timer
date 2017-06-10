React = require 'react'

Clock = require 'Clock'
CountdownForm = require 'CountdownForm'
Controls = require 'Controls'

{h1, h3, div} = React.DOM

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
   # componentWillUpdate: (nextProps, nextState) ->
   #    console.log 'component will update'
   # componentWillMount: ->
   #    console.log 'Component will mount' # no access to refs/html/dom yet
   # componentDidMount: ->
   #    console.log 'Component did mount' # now we have access to dom
   componentWillUnmount: ->
      # console.log 'Component will unmount'
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
         h1
            className: 'page-title'
            'Countdown App'
         React.createElement Clock, {totalSeconds:count}, null
         renderControlArea()


module.exports = Countdown
