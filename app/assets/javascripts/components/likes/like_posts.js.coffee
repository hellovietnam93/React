@LikePosts = React.createClass
  getInitialState: ->
    likes: @props.likes
    user_id: getAuthData().auth.user.id
    post_id: @props.post.id

  addLike: (like) ->
    likes = React.addons.update(@state.likes, {$push: [like]})
    @setState likes: likes

  deleteLike: (like) ->
    index = @state.likes.indexOf like
    likes = React.addons.update(@state.likes, {$splice: [[index, 1]]})
    @replaceState likes: likes

  handleSubmit: (e) ->
    e.preventDefault()
    if @liked()
      $.ajax
        method: "DELETE"
        url: LikePosts_path + "/" + @liked().id
        data:
          authenticity_token: getMetaContent("csrf-token")
        dataType: "JSON"
        success: () =>
          @deleteLike @liked()
          @setState user_id: getAuthData().auth.user.id
          @setState post_id: @props.post.id
    else
      $.post LikePosts_path, {like_post: @state, authenticity_token: getMetaContent("csrf-token")}, (data) =>
        @addLike data
      , "JSON"

  liked: ->
    liked = null
    for like in @state.likes
      if like.user_id == @state.user_id
        liked = like
    liked

  render: ->
    React.DOM.div
      className: "like"
      React.DOM.a
        href: " "
        onClick: @handleSubmit
        React.DOM.i
          className: "fa fa-thumbs-o-up"
      React.DOM.span
        className: "number-like"
        " " + @state.likes.length
