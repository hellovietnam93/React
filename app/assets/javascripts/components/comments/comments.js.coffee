@Comments = React.createClass
  getInitialState: ->
    comments: @props.comments

  addComment: (comment) ->
    comments = React.addons.update(@state.comments, {$push: [comment]})
    @setState comments: comments

  parentRow: ->
    React.DOM.div
      className: "row"
      React.createElement CommentForm, handleNewComment: @addComment, post: @props.post
      React.DOM.div
        className: "comments"
        for comment in @state.comments
          React.createElement Comment, key: comment.id, comment: comment

  childrenRow: ->
    React.DOM.div
      id: "reply-comment-" + @props.parent.id
      className: "row collapse"
      "aria-expanded": false
      React.DOM.div
        className: "comments"
        for comment in @state.comments
          React.createElement Comment, key: comment.id, comment: comment
      React.createElement CommentForm, handleNewComment: @addComment, comment: @props.parent

  render: ->
    if @props.parent == undefined
      @parentRow()
    else
      @childrenRow()
