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
      records = React.addons.update(@state.records, {$push: [record.record]})
      @setState records: records

  updateRecord: (record, data) ->
    unless @state.records is undefined
      index = @state.records.indexOf record
      records = React.addons.update(@state.records, {$splice: [[index, 1, data.record]]})
      @replaceState records: records

  deleteRecord: (record) ->
    unless @state.records is undefined
      index = @state.records.indexOf record.record
      records = React.addons.update(@state.records, {$splice: [[index, 1]]})
      @replaceState records: records

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
            React.DOM.th null, I18n.t('application.action')
        React.DOM.tbody null,
          unless @state.records is undefined
            for record in @state.records
              React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord
