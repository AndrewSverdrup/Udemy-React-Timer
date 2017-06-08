React = require 'react'
{h1, div, ul, li, form, input, a} = React.DOM
{Link, IndexLink} = require 'react-router'

Nav = (props) ->
   div
      className: 'top-bar'
      div
         className: 'top-bar-left'
         ul
            className: 'menu'
            li
               className: 'menu-text'
               'React Timer App'
            li {},
               React.createElement(IndexLink, {to: '/#',activeClassName:"active-link"}, 'Timer')
            li {},
               React.createElement(Link, {to: '/countdown',activeClassName:"active-link"}, 'Countdown')

      div
         className: 'top-bar-right'
         ul
            className: 'menu menu-text'
            'Created by '
            a
               href: 'https://github.com/AndrewSverdrup'
               target: '_blank'
               'Andrew Sverdrup'

module.exports = Nav
