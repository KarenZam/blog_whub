$ ->
  # USER
  $('section').on 'click', 'ul .users', (e) ->
    console.log "clicked on #{$(@).data('id')}"
    id = $(@).data('id')
    $.ajax "/api/users/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#user-template').html()
        template = Handlebars.compile(source)
        output = template(data.users[0])
        $('#content-users').html(output)


  $.ajax '/api/users',
    type: 'GET',
    dataType: 'json',
    success: (data) ->
      #Get the template from the script element
      source = $('#users-template').html()
      
      #Compile the template to a JS function
      template = Handlebars.compile(source)
      
      #Call the template function and pass in the data to return the html
      output = template(data)

      #Insert that html into the template
      $('#content-users').html(output)

  # USER
  $.ajax '/api/articles',
    type: 'GET',
    dataType: 'json',
    success: (data) ->
      #Get the template from the script element
      source = $('#articles-template').html()
      
      #Compile the template to a JS function
      template = Handlebars.compile(source)
      
      #Call the template function and pass in the data to return the html
      output = template(data)

      #Insert that html into the template
      $('#content-articles').html(output)



