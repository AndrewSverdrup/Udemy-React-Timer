React = require 'react'
Nav = require 'Nav'

{div, p} = React.DOM

Main = (props) ->
      div {},
         React.createElement(Nav, {}, null)
         div {},
            div {},
               p {},
                  props.children

module.exports = Main;
