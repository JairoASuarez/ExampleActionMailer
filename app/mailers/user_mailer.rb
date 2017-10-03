#Mailer generado, con un metodo el cual se encarga de enviar un mensaje de bienvenida cuando un usuario se registra
class UserMailer < ApplicationMailer

    default from: 'notifications@example.com'
 
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
