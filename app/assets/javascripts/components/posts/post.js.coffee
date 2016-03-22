@Post = React.createClass
  render: ->
    React.DOM.div
      id: "post-" + @props.post.id
      className: "panel"
      React.DOM.div
        className: "panel-heading"
        React.DOM.a
          href: Users_path + "/" + @props.post.user_id
          @props.post.user.username
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
        React.createElement Comments, comments: @props.post.comments
