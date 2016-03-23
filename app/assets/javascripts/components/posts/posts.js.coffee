@Posts = React.createClass
  getInitialState: ->
    posts: @props.data

  addPost: (post) ->
    posts = React.addons.update(@state.posts, {$push: [post]})
    @setState posts: posts

  deletePost: (post) ->
    index = @state.posts.indexOf post.post
    posts = React.addons.update(@state.posts, {$splice: [[index, 1]]})
    @replaceState posts: posts

  render: ->
    React.DOM.div
      className: "row"
      React.DOM.div
        className: "col-md-10 col-md-offset-1"
        React.DOM.h2
          className: "title"
          I18n.t("posts.post")
        React.DOM.hr null
        React.DOM.div
          className: "row"
          React.DOM.div
            className: "col-lg-8 col-lg-offset-2"
            React.createElement PostForm, handleNewPost: @addPost
        React.DOM.hr null
        React.DOM.div null
          for post in @state.posts
            React.createElement Post, key: post.id, post: post, handleDeletePost: @deletePost
