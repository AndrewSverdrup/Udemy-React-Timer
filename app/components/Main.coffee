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


# Main = React.createClass
#    render: () ->
#       div {},
#          React.createElement(Nav,{},null)
#          h2 {},
#             'Main Component'
#          @props.children

module.exports = Main;
