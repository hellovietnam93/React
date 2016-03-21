@SignUp = React.createClass
  getInitialState: ->
    email: ''
    password: ''
    password_confirmation: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: "http://localhost:3000/users"
      data:
        user: @state
      success: ->
        location.reload()
        return
      error: ->
        alert(I18n.t('flashs.authentication_fails'))
        return

  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.div
        className: 'col-md-4 col-md-offset-4'
        React.DOM.div
          className: 'login-panel panel panel-default'
          React.DOM.div
            className: 'panel-heading'
            React.DOM.h3
              className: 'panel-title'
              I18n.t('users.titles.sign_up')
          React.DOM.div
            className: 'panel-body'
            React.DOM.form
              'role': 'form'
              className: 'new_user'
              id: 'new_user'
              onSubmit: @handleSubmit
              React.DOM.fieldset
                className: 'sign_up_form'
                React.DOM.div
                  className: 'form-group'
                  React.DOM.input
                    id: 'user_email'
                    type: 'text'
                    className: 'form-control'
                    placeholder: I18n.t('users.headers.email')
                    name: 'email'
                    value: @state.email
                    onChange: @handleChange
                React.DOM.div
                  className: 'form-group'
                  React.DOM.input
                    id: 'user_password'
                    type: 'password'
                    className: 'form-control'
                    placeholder: I18n.t('users.headers.password')
                    name: 'password'
                    value: @state.password
                    onChange: @handleChange
                React.DOM.div
                  className: 'form-group'
                  React.DOM.input
                    id: 'user_password'
                    type: 'password'
                    className: 'form-control'
                    placeholder: I18n.t('users.headers.password_confirmation')
                    name: 'password_confirmation'
                    value: @state.password_confirmation
                    onChange: @handleChange
                React.DOM.button
                  type: 'submit'
                  className: 'btn btn-lg btn-success btn-block'
                  I18n.t('users.titles.sign_up')
