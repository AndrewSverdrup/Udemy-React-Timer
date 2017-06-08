React = require 'react'

{div, span} = React.DOM

Clock = React.createClass
   getDefaultProps: () ->
      totalSeconds: 0
   propTypes:
      totalSeconds: React.PropTypes.number
   formatSeconds: (totalSeconds) ->
      minutes = Math.floor totalSeconds / 60
      seconds = totalSeconds % 60
      minutes = '0' + minutes if minutes < 10
      seconds = '0' + seconds if seconds < 10
      time = minutes + ':' + seconds
   render: () ->
      {totalSeconds} = @props
      div
         className: 'clock'
         span
            className: 'clock-text'
            @formatSeconds totalSeconds


module.exports = Clock
