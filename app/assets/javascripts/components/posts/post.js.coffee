@Post = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: "DELETE"
      url: Posts_path + "/" + @props.post.id
      data:
        authenticity_token: getMetaContent("csrf-token")
      dataType: "JSON"
      success: () =>
        @props.handleDeletePost @props.post

  render: ->
    React.DOM.div
      id: "post-" + @props.post.id
      className: "panel"
      React.DOM.div
        className: "panel-heading"
        React.DOM.a
          href: Users_path + "/" + @props.post.user_id
          @props.post.user.username
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
            React.DOM.li null
              React.DOM.a
                onClick: @handleDelete
                I18n.t("posts.actions.delete")
        React.DOM.div
          className: "timestamp"
          @props.post.updated_at

      React.DOM.div
        className: "panel-body"
        React.DOM.p
          className: "content"
          @props.post.content
        React.createElement Likes, likes: @props.post.like_posts
        React.DOM.a
          className: "collapsed"
          "data-toggle": "collapse"
          href: "#comments-post-" + @props.post.id
          "aria-expanded": false
          I18n.t("comments.actions.comment")

      React.DOM.div
        id: "comments-post-" + @props.post.id
        className: "panel-footer collapse"
        "aria-expanded": false
        React.createElement Comments, comments: @props.post.comments, post: @props.post
