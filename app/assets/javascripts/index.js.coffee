$ ->

      #------------------------------------------------------------------------#
  #FUNCTIONS
  #DISPLAY ALL USERS

  showUsers = () ->
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
        $('#content').html(output)

  #DISPLAY A USER 
  showUser = (id) ->
    $.ajax "/api/users/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#user-template').html()
        template = Handlebars.compile(source)
        output = template(data.users[0])
        $('#content').html(output)

  #DISPLAY ALL ARTICLES
  showArticles = () ->
    $.ajax '/api/articles',
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#articles-template').html()
        template = Handlebars.compile(source)
        output = template(data)
        $('#content-articles').html(output)

  #DISPLAY AN ARTICLE 
  showArticle = (id) ->
    console.log(id)
    $.ajax "/api/articles/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#article-template').html()
        template = Handlebars.compile(source)
        output = template(data.articles[0])
        $('#content-articles').html(output)

  #DISPLAY ALL TAGS
  showTags = () ->
    $.ajax '/api/tags',
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#tags-template').html()
        template = Handlebars.compile(source)
        output = template(data)
        $('#content-tags').html(output)

  #DISPLAY A TAGS
  showTag = (id) ->
    $.ajax '/api/tag/#{id}',
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#tags-template').html()
        template = Handlebars.compile(source)
        output = template(data.tags[0])
        $('#content-tags').html(output)

        #------------------------------------------------------------------------#
  
  showUsers()
  showArticles()
  showTags()

  #FROM USERS - DISPLAY A USER 
  $('section').on 'click', 'ul .users', (e) ->
    id = $(@).data('id')
    showUser(id)

  #FROM USER - BACK TO USERS
  $('section').on 'click', '#back-to-users', (e) ->
    showUsers()


  #FROM ARTICLES - DISPLAY AN ARTICLE 
  $('section').on 'click', 'ul .articles', (e) ->
    console.log "clicked on #{$(@).data('id')}"
    id = $(@).data('id')
    showArticle(id)
    

  #FROM ARTICLE - BACK TO ARTICLES
  $('section').on 'click', '#back-to-articles', (e) ->
    showArticles()

