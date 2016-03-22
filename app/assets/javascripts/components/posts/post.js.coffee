@Post = React.createClass
  render: ->
    React.DOM.li
      id: "post-{@props.post.id}"
      React.DOM.p null
        React.DOM.div null
          React.DOM.a
            href: Users_path + "/" + @props.post.user_id
            @props.post.user.username
        React.DOM.div
          className: "timestamp"
          @props.post.updated_at
        React.DOM.span
          className: "content"
          @props.post.content
        React.createElement Likes, likes: @props.post.like_posts
        React.createElement Comments, comments: @props.post.comments
