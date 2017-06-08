React = require 'react'
Nav = require 'Nav'

{div, p} = React.DOM

Main = (props) ->
      div {},
         React.createElement(Nav, {}, null)
         div
            className: 'row'
            div
               className: 'column small-centered medium-6 large-4'
               props.children

module.exports = Main;
