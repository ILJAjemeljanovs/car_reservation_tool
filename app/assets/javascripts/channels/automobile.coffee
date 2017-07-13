App.automobile = App.cable.subscriptions.create "AutomobileChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['action'] == 'create'
      $('#' + data['date']).find('tr#user_' + data['user_id']).find('#car_' + data['car_id']).append(data['time_period'])
    else if data['action'] == 'delete'
      $('#reservation_' + data['reservation_id']).remove()

  reserve: ->
    # @perform 'reserve'
