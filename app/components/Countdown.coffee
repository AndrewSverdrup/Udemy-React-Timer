React = require 'react'

Clock = require 'Clock'
CountdownForm = require 'CountdownForm'

{h3, div} = React.DOM

Countdown = React.createClass
   getInitialState: ->
      count: 0
   handleSetCountdown: (seconds) ->
      @setState
         count: seconds
   render: ->
      {count} = @state
      div {},
         React.createElement Clock, {totalSeconds:count}, null
         React.createElement CountdownForm, {onSetCountdown: @handleSetCountdown}, null

module.exports = Countdown
