@Post = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.title).value
      date: ReactDOM.findDOMNode(@refs.date).value
      amount: ReactDOM.findDOMNode(@refs.amount).value
    $.ajax
      method: "PUT"
      url: Records_path + "/" + @props.record.id
      dataType: "JSON"
      data:
        record: data
        authenticity_token: getMetaContent("csrf-token")
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data

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
            React.DOM.li
              className: "edit"
              React.DOM.a
                href: ""
                onClick: @handleDelete
                I18n.t("posts.actions.edit")
            React.DOM.li
              className: "delete"
              React.DOM.a
                href: ""
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
        React.createElement LikePosts, likes: @props.post.like_posts, post: @props.post
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
