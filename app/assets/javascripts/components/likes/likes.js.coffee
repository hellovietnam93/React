@Likes = React.createClass
  render: ->
    React.DOM.div
      className: "post-like"
      React.DOM.i
        className: "fa fa-thumbs-o-up"
      React.DOM.span
        className: "number-like"
        " " + @props.likes.length

