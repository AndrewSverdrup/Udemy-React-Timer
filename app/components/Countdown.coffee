React = require 'react'

Clock = require 'Clock'
{h3, div} = React.DOM

Countdown = (props) ->
   div {},
      React.createElement Clock, {totalSeconds:129}, null

module.exports = Countdown
