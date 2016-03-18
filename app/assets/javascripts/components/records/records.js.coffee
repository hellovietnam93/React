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
  credits: ->
    unless @state.records is undefined
      credits = @state.records.filter (val) -> val.amount >= 0
      credits.reduce ((prev, curr) ->
        prev + parseFloat(curr.amount)
      ), 0

  debits: ->
    unless @state.records is undefined
      debits = @state.records.filter (val) -> val.amount < 0
      debits.reduce ((prev, curr) ->
        prev + parseFloat(curr.amount)
      ), 0

  balance: ->
    @debits() + @credits()

  deleteRecord: (record) ->
    unless @state.records is undefined
      records = @state.records.slice()
      index = records.indexOf record
      records.splice index, 1
      @replaceState records: records

  render: ->
    React.DOM.div
      className: 'records'

      React.DOM.h2
        className: 'title'
        I18n.t('records.all')

      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @credits(), text: I18n.t('records.headers.credit')
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: I18n.t('records.headers.debit')
        React.createElement AmountBox, type: 'info', amount: @balance(), text: I18n.t('records.headers.balance')

      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr null

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, I18n.t('records.headers.date')
            React.DOM.th null, I18n.t('records.headers.title')
            React.DOM.th null, I18n.t('records.headers.amount')
            React.DOM.th null, I18n.t('records.headers.action')
        React.DOM.tbody null,
          unless @state.records is undefined
            for record in @state.records
              React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord
