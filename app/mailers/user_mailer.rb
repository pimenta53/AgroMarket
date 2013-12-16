class UserMailer < ActionMailer::Base
  default from: "no-reply@agrosocial.pt" 
  
  def new_user_email(user,password)
    @user = user
    @pass = password
    mail(to: @user.email, subject: 'Bem vindo a AgroSocial')
  end
end
