@Comment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: "DELETE"
      url: Comments_path + "/" + @props.comment.id
      data:
        authenticity_token: getMetaContent("csrf-token")
      dataType: "JSON"
      success: () =>
        @props.handleDeleteComment @props.comment

  render: ->
    React.DOM.blockquote
      id: "comment-" + @props.comment.id
      React.DOM.div
        className: "contain"
        React.DOM.div
          className: "username"
          React.DOM.a
            href: Users_path + "/" + @props.comment.user_id
            @props.comment.user.username
          React.DOM.span
            className: "pull-right dropdown"
            React.DOM.a
              className: "dropdown-toggle"
              href: " "
              "data-toggle": "dropdown"
              "aria-expanded": false
              React.DOM.i
                className: "fa fa-caret-down fa-fw"
            React.DOM.ul
              className: "dropdown-menu"
              React.DOM.li
                className: "edit"
                React.DOM.a
                  href: ""
                  onClick: @handleDelete
                  I18n.t("comments.actions.edit")
              React.DOM.li
                className: "delete"
                React.DOM.a
                  href: ""
                  onClick: @handleDelete
                  I18n.t("comments.actions.delete")
          React.DOM.span
            className: "content"
            " " + @props.comment.content
        React.createElement LikeComments, likes: @props.comment.like_comments, comment: @props.comment
        unless @props.comment.parent_id
          React.DOM.a
            className: "collapsed"
            "data-toggle": "collapse"
            href: "#reply-comment-" + @props.comment.id
            "aria-expanded": false
            I18n.t("comments.actions.reply")
        React.DOM.span
          className: "timestamp"
          @props.comment.updated_at
        unless @props.comment.parent_id
          React.createElement Comments, comments: @props.comment.children, parent: @props.comment
