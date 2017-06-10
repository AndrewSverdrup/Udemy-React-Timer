React = require 'react'

{div, form, input, button} = React.DOM

CountdownForm = React.createClass
   onSubmit: (e) ->
      e.preventDefault()

      strSeconds = @refs.seconds.value

      if strSeconds.match(/^[0-9]*$/)
         @refs.seconds.value = ''
         @props.onSetCountdown parseInt strSeconds, 10
   render: () ->
      div {},
         form
            ref: 'form'
            onSubmit: @onSubmit
            className: 'countdown-form'
            input
               type: 'text'
               ref: 'seconds'
               placeholder: 'Enter time in seconds'
            button
               className: 'button expanded'
               'Start'


module.exports = CountdownForm
