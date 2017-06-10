React = require 'react'

{button, div} = React.DOM

Controls = React.createClass
   propTypes:
      countdownStatus: React.PropTypes.string.isRequired
      onStatusChange: React.PropTypes.func.isRequired
   onStatusChange: (newStatus) ->
      () => # This must be => not ->. b/c  @ (this) is used inside it
         @props.onStatusChange newStatus
   render: () ->
      {countdownStatus} = @props
      renderStartStopButton = => # This must be =>, not ->. Why?
         if countdownStatus is 'started'
            button
               onClick: @onStatusChange 'paused'
               className: 'button secondary'
               'Pause'
         else if countdownStatus is 'paused'
            button
               onClick: @onStatusChange 'started'
               className: 'button primary'
               'Start'
      div
         className: 'controls'
         renderStartStopButton()
         button
            onClick: @onStatusChange 'stopped'
            className: 'button alert hollow'
            'Clear'


module.exports = Controls
