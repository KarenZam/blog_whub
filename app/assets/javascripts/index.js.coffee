$ ->

      #------------------------------------------------------------------------#
  #FUNCTIONS
  #DISPLAY ALL USERS

  showUsers = () ->
    $.ajax '/api/users',
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        #Compile the template to a JS function
        template = Handlebars.templates.users
        #Call the template function and pass in the data to return the html
        output = template(data)
        #Insert that html into the template
        $('#content-users').html(output)

  #DISPLAY A USER 
  showUser = (id) ->
    $.ajax "/api/users/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#user-template').html()
        template = Handlebars.compile(source)
        output = template(data.users[0])
        $('#content-users').html(output)

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

  #FROM TAGS - DISPLAY ARTICLES BY SELECTED TAG
  ShowTagArticles = (id) ->
    $.ajax "/api/tags/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#tag-articles-template').html()
        template = Handlebars.compile(source)
        output = template(data.tags[0])
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

  #DISPLAY A TAG
  showTag = (id) ->
    console.log(id)
    $.ajax "/api/tags/#{id}",
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        source = $('#tag-template').html()
        template = Handlebars.compile(source)
        output = template(data.tags[0])
        $('#content-tags').html(output)

        #------------------------------------------------------------------------#
  
  showUsers()
  showArticles()
  showTags()

  #FROM USERS - DISPLAY A USER 
  $('section').on 'click', 'ul .users', (e) ->
    id = $(@).data('user-id')
    showUser(id)

  #FROM USER - BACK TO USERS
  $('section').on 'click', '#back-to-users', (e) ->
    showUsers()


  #FROM ARTICLES - DISPLAY AN ARTICLE 
  $('section').on 'click', '.articles', (e) ->
    console.log "clicked on #{$(@).data('article-id')}"
    console.log "display an article"
    id = $(@).data('article-id')
    showArticle(id)
    

  #FROM ARTICLE - BACK TO ARTICLES
  $('section').on 'click', '#back-to-articles', (e) ->
    showArticles()

  #FROM TAGS - DISPLAY A TAG / ARTICLES 
  $('section').on 'click', 'ul .tags', (e) ->
    console.log "display a tag"
    id = $(@).data('tag-id')
    console.log id
    showTag(id)
    ShowTagArticles(id)

  #FROM TAG - BACK TO TAGS
  $('section').on 'click', '#back-to-tags', (e) ->
    showTags()
    showArticles()


  #CREATE AN ARTICLE
  $('#submit-article').on 'click',  ->
    tagArray = new Array()
    title = $('#title').val()
    body = $('#body').val()
    author = $('#author').val()
    tagArray = $('#create-article-display-tags').text().split(', ')
    formattedBadges = $.map tagArray, (item, index) ->
      {badge: item}
    console.table formattedBadges
    $.ajax "/api/articles",
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({article: {title: title, body: body, author: author, is_published: false}, tags: formattedBadges}),
      success: (x) ->
        console.log x
    showArticles()


  $("#tag").on 'keyup', (e) ->
    if e.which == 13 || e.which == 188 # "enter" ","
      tagArray = new Array()
      tag = $('#tag').val().toLowerCase()
      if $('#create-article-display-tags').text() != ""
        tagArray = $('#create-article-display-tags').text().split(', ')
        if jQuery.inArray( tag, tagArray ) != -1
          $("#tag").val('')          
          return
      $("#tag").val('')
      console.log "tag : " + tag
      if e.which == 188
        tag = tag.slice(0,-1)
      if $("#create-article-display-tags").text() != ""
        $("#create-article-display-tags").append(", ")
      $("#create-article-display-tags").append(tag)
      

  #DELETE AN ARTICLE
  $('#content-articles').on 'click', '.article-form-opener', (e) ->
    id = $(@).parent().data('article-id')
    $('#deleteArticleModal').modal('show')
    console.log "Setting ID to #{id}"
    $('#delete-article').data('delete-article-id', id)


  $('#delete-article').on 'click',  ->
    id = $(@).data('delete-article-id')
    $.ajax "/api/articles/#{id}",
      type: 'DELETE',
      success: (data) ->
        console.log data
    showArticles()

  #UPDATE AN ARTICLE
  $('#update-article').on 'click',  ->
    title = $('input #title').val
    $.ajax "/api/articles/#{id}",
      type: 'PATCH',
      contentType: 'application/json',
      data: JSON.stringify({article: {title: title, body: "body test", author: "author test", is_published: false, tags_attributes: [{ badge: "badge test"}, {badge: "test 2"}]}}),
      success: (x) ->
        console.log x

  #CREATE A COMMENT
  $('#content-articles').on 'click', '#add-comment', (e) ->
    if $('#comment-body').val() == ""
      console.log "can not post comment body empty"
      return
    body = $('#comment-body').val()
    article_id = $(@).data('article-id')

    $.ajax "/api/articles/#{article_id}/comments",
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({body: body})
      success: (x) ->
        console.log x
    showArticle(article_id)

        #------------------------------------------------------------------------#

  #ON CLICK LIGHT
  $('#light').on 'click',  ->
    # options = {};
    # options = { percent: 200 };
    $("body").toggleClass "light dark"
    console.log $('#light a').text()
    if $('#light a').text() == "Light" 
      $('#light a').text('Dark')  
    else $('#light a').text('Light')
    
    # console.log $( "#tags" )
    # $( "#all-tags" ).show 'scale', options, 500
      

      
        



