@SignIn = React.createClass
  getInitialState: ->
    email: ''
    password: ''
    remember_me: 0

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: "http://localhost:3000/users/sign_in"
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
              I18n.t('users.titles.sign_in')
          React.DOM.div
            className: 'panel-body'
            React.DOM.form
              'role': 'form'
              className: 'new_user'
              id: 'new_user'
              onSubmit: @handleSubmit
              React.DOM.fieldset
                className: 'sign_in_form'
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
                  className: 'checkbox'
                  React.DOM.input
                    type: 'hidden'
                    name: 'remember_me'
                    value: 0
                  React.DOM.label
                    className: 'remember_me'
                    React.DOM.input
                      id: 'user_remember_me'
                      type: 'checkbox'
                      name: 'remember_me'
                      value: 1
                      onChange: @handleChange
                    I18n.t('users.headers.remember_me')
                React.DOM.button
                  type: 'submit'
                  className: 'btn btn-lg btn-success btn-block'
                  I18n.t('users.titles.sign_in')
          React.DOM.a
            className: 'sign_up'
            href: 'http://localhost:3000/users/sign_up'
            I18n.t('users.titles.sign_up')
