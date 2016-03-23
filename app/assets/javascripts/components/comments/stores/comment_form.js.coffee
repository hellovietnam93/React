@CommentForm = React.createClass
  getInitialState: ->
    content: ""
    user_id: Current_user.id
    post_id: @handlePostId()
    parent_id: @handleParentId()

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handlePostId: ->
    if @props.post != undefined
      @props.post.id

  handleParentId: ->
    if @props.post == undefined
      @props.comment.id

  valid: ->
    @state.content

  handleSubmit: (e) ->
    e.preventDefault()
    $.post Comments_path, {comment: @state, authenticity_token: getMetaContent("csrf-token")}, (data) =>
      @props.handleNewComment data
      @setState @getInitialState()
    , "JSON"

  render: ->
    React.DOM.div
      className: "row"
      React.DOM.div
        className: "col-md-1"
        Current_user.username
      React.DOM.div
        className: "col-md-11"
        React.DOM.form
          className: "new_comment"
          id: "new_comment"
          onSubmit: @handleSubmit
          React.DOM.div
            className: "form-group"
            React.DOM.input
              type: "text"
              className: "form-control"
              placeholder: I18n.t("comments.headers.content")
              name: "content"
              value: @state.content
              onChange: @handleChange
          React.DOM.button
            type: "submit"
            className: "btn btn-primary pull-right"
            disabled: !@valid()
            I18n.t("comments.actions.comment")
