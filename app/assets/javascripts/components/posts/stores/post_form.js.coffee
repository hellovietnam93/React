@PostForm = React.createClass
    getInitialState: ->
      title: ""
      content: ""
      user_id: Current_user.id

    handleChange: (e) ->
      name = e.target.name
      @setState "#{name}": e.target.value

    valid: ->
      @state.title && @state.content

    handleSubmit: (e) ->
      e.preventDefault()
      $.post Posts_path, {post: @state, authenticity_token: getMetaContent("csrf-token")}, (data) =>
        @props.handleNewPost data
        @setState @getInitialState()
      , "JSON"

    render: ->
      React.DOM.form
        className: "new_post"
        id: "new_post"
        onSubmit: @handleSubmit
        React.DOM.div
          className: "form-group"
          React.DOM.input
            type: "text"
            className: "form-control"
            placeholder: I18n.t("posts.headers.title")
            name: "title"
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: "form-group"
          React.DOM.textarea
            type: "text"
            className: "form-control"
            placeholder: I18n.t("posts.headers.content")
            name: "content"
            value: @state.content
            onChange: @handleChange
        React.DOM.button
          type: "submit"
          className: "btn btn-primary pull-right"
          disabled: !@valid()
          I18n.t("posts.actions.create")
