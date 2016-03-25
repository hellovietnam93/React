@getMetaContent = (name) ->
  metas = document.getElementsByTagName("meta")
  i = 0
  while i < metas.length
    if metas[i].getAttribute("name") == name
      return metas[i].getAttribute("content")
    i++
  ""

@getAuthData = () ->
  response = null
  $.ajax
    method: "GET"
    url: "http://localhost:3000/auth/is_signed_in"
    async: false
    success: ((data) ->
      response = data
      @Current_user = data.auth.user
      @User_sign_in = data.auth.signed_in
    ).bind(this)
  response

@findIndexByKeyValue = (arraytosearch, key, valuetosearch) ->
  i = 0
  while i < arraytosearch.length
    if arraytosearch[i][key] == valuetosearch
      return i
    i++
  null

@searchByKeyValue = (arraytosearch, key, value) ->
  results = []
  if value
    arraytosearch.map (item) ->
      result = item[key].toLowerCase()
      if result.indexOf(value.toLowerCase()) != -1
        results.push item
  else
    results = arraytosearch
  results
