@Comment = React.createClass
  render: ->
    React.DOM.blockquote
      id: "comment-" + @props.comment.id
      React.DOM.p null
        React.DOM.div null
          React.DOM.a
            href: Users_path + "/" + @props.comment.user_id
            @props.comment.user.username
        React.DOM.span
          className: "content"
          " " + @props.comment.content
        React.createElement Likes, likes: @props.comment.like_comments
        if @props.comment.parent_id == undefined
          React.DOM.a
            className: "collapsed"
            "data-toggle": "collapse"
            href: "#reply-comment-" + @props.comment.id
            "aria-expanded": false
            I18n.t("comments.actions.reply")
        React.DOM.span
          className: "timestamp"
          @props.comment.updated_at
        if @props.comment.parent_id == undefined
          React.createElement Comments, comments: @props.comment.children, parent: @props.comment
