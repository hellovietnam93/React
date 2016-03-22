@Header = React.createClass
  handleSignout: (e) ->
    e.preventDefault()
    $.ajax
      method: "DELETE"
      url: Sign_out_path
      success: ->
        location.reload()
        return

  not_sign_in: ->
    React.DOM.ul
      className: "nav navbar-nav navbar-right"
      React.DOM.li
        className: "sign-in"
        React.DOM.a
          href: Sign_in_path
          React.DOM.i
            className: "fa fa-sign-in fa-tw"
          " " + I18n.t("users.titles.sign_in")
  sign_in: ->
    React.DOM.ul
      className: "nav navbar-nav navbar-right"
      React.DOM.li
        className: "posts"
        React.DOM.a
          href: Posts_path
          I18n.t("posts.post")
      React.DOM.li
        className: "users"
        React.DOM.a
          href: Users_path
          I18n.t("users.user")
      React.DOM.li
        className: "records"
        React.DOM.a
          href: Records_path
          I18n.t("records.all")
      React.DOM.li
        className: "dropdown"
        React.DOM.a
          className: "dropdown-toggle"
          href: " "
          "data-toggle": "dropdown"
          "aria-expanded": false
          React.DOM.i
            className: "fa fa-user fa-fw"
          getAuthData().auth.user.email
          React.DOM.i
            className: "fa fa-caret-down"
        React.DOM.ul
          className: "dropdown-menu"
          React.DOM.li
            className: "divider"
          React.DOM.li
            className: "profile"
            React.DOM.a
              href: Users_path + "/" + getAuthData().auth.user.id
              React.DOM.i
                className: "fa fa-user fa-tw"
              " " + I18n.t("users.titles.profile")
          React.DOM.li
            className: "setting"
            React.DOM.a
              href: Users_path + "/edit"
              React.DOM.i
                className: "fa fa-gear fa-tw"
              " " + I18n.t("users.titles.setting")
          React.DOM.li
            className: "divider"
          React.DOM.li
            className: "sign-out"
            React.DOM.a
              href: " "
              onClick: @handleSignout
              React.DOM.i
                className: "fa fa-sign-out fa-tw"
              " " + I18n.t("users.titles.sign_out")
  render: ->
    React.DOM.nav
      className: "navbar navbar-default navbar-static-top"
      "role": "navigation"
      React.DOM.div
        className: "container-fluid"
        React.DOM.div
          className: "navbar-header"
          React.DOM.a
            className: "navbar-brand"
            href: Root_path
            I18n.t("application.base_title")
        if getAuthData().auth.signed_in
          @sign_in()
        else
          @not_sign_in()
