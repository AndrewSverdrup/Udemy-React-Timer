React = require 'react'
Nav = require 'Nav'

{div, p} = React.DOM

Main = (props) ->
      div {},
         React.createElement(Nav, {}, null)
         div {},
            div {},
               props.children
               p {},
                  null

module.exports = Main;
