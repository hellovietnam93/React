@Records = React.createClass
  getInitialState: ->
    records: undefined

  componentWillMount: ->
    @serverRequest = $.getJSON('http://localhost:3000/records.json', ((json) ->
      @setState records: json.records
      return
    ).bind(this))
    return

  addRecord: (record) ->
    unless @state.records is undefined
      records = @state.records.slice()
      records.push record.record
      @setState records: records

  render: ->
    React.DOM.div
      className: "records"
      React.DOM.h2
        className: "title"
        "Records"
      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Amount'
        React.DOM.tbody null,
          console.log @state.records
          unless @state.records is undefined
            for record in @state.records
              React.createElement Record, key: record.id, record: record
