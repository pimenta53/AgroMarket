class UserMailer < ActionMailer::Base
  default from: 'agro.social2@gmail.com'
 
  def welcome_email(email,user)
    @user = user
    @email = email
    @url  = 'http://localhost:3000/ads'
    mail(to: email, subject: 'Bem vindo ao AgroSocial')
  end


  def send_message_ad(sender,ad,msg)
  	@sender = sender
  	@ad = ad
  	@msg = msg
  	mail(to: "paulo.4624@gmail.com", subject: 'AgroSocial - Resposta ao anúncio')
  end
end
