class Notifier < ActionMailer::Base
  default from: "W Hub <chleo@gmail.com>"
  
  def password_reset_request(user)
    @user = user
    
    mail to: @user.email, subject: "[W Hub] Reset your credentials"
  end
  
  def password_reset(user)
    @user = user
    
    mail to: @user.email, subject: "[W Hub] Your password was reset"
  end
  
  def registration_request(registrant)
    @registrant = registrant
    
    mail to: @registrant.email, subject: "[W Hub] Complete your registration"
  end
  
  def registration(user)
    @user = user
    
    mail to: @user.email, subject: "[W Hub] Thank you for registering"
  end
end