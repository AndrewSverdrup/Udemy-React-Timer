React = require 'react'

{button, div} = React.DOM

Controls = React.createClass
   propTypes:
      countdownStatus: React.PropTypes.string.isRequired
   render: ->
      {countdownStatus} = @props
      renderStartStopButton = ->
         if countdownStatus is 'started'
            button
               className: 'button secondary'
               'Pause'
         else if countdownStatus is 'paused'
            button
               className: 'button primary'
               'Start'
      div
         className: 'controls'
         renderStartStopButton()
         button
            className: 'button alert hollow'
            'Clear'


module.exports = Controls
