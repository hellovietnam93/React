@Comment = React.createClass
  render: ->
    React.DOM.div
      id: "comment-{@props.comment.id}"
      React.DOM.p null
        React.DOM.div null
          React.DOM.a
            href: Users_path + "/" + @props.comment.user_id
            @props.comment.user.username
        React.DOM.div
          className: "timestamp"
          @props.comment.updated_at
        React.DOM.span
          className: "content"
          @props.comment.content
        React.createElement Likes, likes: @props.comment.like_comments
        if @props.comment.parent_id == undefined
          React.createElement Comments, comments: @props.comment.children
