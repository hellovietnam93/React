@RecordForm = React.createClass
    getInitialState: ->
      title: ""
      date: ""
      amount: ""

    valid: ->
      @state.title && @state.date && @state.amount

    handleChange: (e) ->
      name = e.target.name
      @setState "#{name}": e.target.value

    handleSubmit: (e) ->
      e.preventDefault()
      $.post Records_path, {record: @state, authenticity_token: getMetaContent("csrf-token")}, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , "JSON"

    render: ->
      React.DOM.form
        className: "form-inline"
        onSubmit: @handleSubmit
        React.DOM.div
          className: "form-group"
          React.DOM.input
            type: "text"
            className: "form-control"
            placeholder: I18n.t("records.headers.date")
            name: "date"
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: "form-group"
          React.DOM.input
            type: "text"
            className: "form-control"
            placeholder: I18n.t("records.headers.title")
            name: "title"
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: "form-group"
          React.DOM.input
            type: "number"
            className: "form-control"
            placeholder: I18n.t("records.headers.amount")
            name: "amount"
            value: @state.amount
            onChange: @handleChange
        React.DOM.button
          type: "submit"
          className: "btn btn-primary"
          disabled: !@valid()
          I18n.t("records.actions.create")
