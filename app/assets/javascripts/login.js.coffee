$ ->
  $('.login-options').children('li').children('a').on 'click', (e) ->
    $('.login-options').find('li').removeClass('active')
    $(@).parent().addClass('active')
    
    switch $(@)[0].id
      when 'register-pill'
        $('legend').html('Please enter your email')
        $('#password-label').hide()
        $('#user_password').hide()
        $('#show-password-button').hide()
        $('#submit-button').val('Register')
      when 'reset-pill'
        $('legend').html('Please enter your email')
        $('#password-label').hide()
        $('#user_password').hide()
        $('#show-password-button').hide()
        $('#submit-button').val('Reset')
      else
        $('legend').html('Please sign in')
        $('#password-label').show()
        $('#user_password').show()
        $('#show-password-button').show()
        $('#submit-button').val('Sign in')
    
    e.preventDefault()
