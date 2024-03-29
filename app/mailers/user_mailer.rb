class UserMailer < ActionMailer::Base
  default from: 'agro.social2@gmail.com'
 
  def welcome_email(email,user)
    @user = user
    @email = email
  	 @url = "http://teste94.di.uminho.pt" + ads_path
    mail(to: email, subject: 'Bem vindo ao AgroSocial')
  end

  def send_message_ad(destination,name_sender,name_ad,msg)
  	@destination = destination
  	@name_sender = name_sender
  	@name_ad = name_ad
  	@msg = msg
  	mail(to: destination, subject: 'AgroSocial - Resposta ao anúncio')
  end

  def new_user_email(destination, name, password)
  	@destination = destination
  	@name = name
  	@password = password
  	@url = "http://teste94.di.uminho.pt" + ads_path
  	mail(to: destination, subject: 'Bem vindo ao AgroSocial')
  end
  
  def report_email(user, reporter, ad)
    report_email_repository = 'agro.social2@gmail.com'
    
    @user = user
    @reporter = reporter
    @ad = ad
    @root = "http://teste94.di.uminho.pt"
    
  	 mail(to: report_email_repository, subject: 'AgroSocial:System: Denuncia - ' + @ad.title)
  end
end
