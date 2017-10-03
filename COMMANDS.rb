#Ejemplo Action Mailer

#Crear Proyecto
rails new example

#Acceder a la carpeta
cd example

#Crear mailer
rails g mailer UserMailer

#Editar Mailer en app/mailers/user_mailer.rb

Class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

#Crear Mailer View en /app/views/usermailer/
welcome_email.html.erb y welcome_email.text.erb en app/views/user_mailer/

<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.name %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @user.login %>.<br>
    </p>
    <p>
      To login to the site, just follow this link: <%= @url %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>

welcome_email.text.erb in app/views/user_mailer/

Welcome to example.com, <%= @user.name %>
===============================================
 
You have successfully signed up to example.com,
your username is: <%= @user.login %>.
 
To login to the site, just follow this link: <%= @url %>.
 
Thanks for joining and have a great day!


#Llamar mailer por medio de un scaffold 
rails generate scaffold user name email login

#Realizar Migración
rails db:migrate

#Actualizar controlador en app/controllers/users_controller.rb
UserMailer.welcome_email(@user).deliver_later

#Configuracion gmail en entorno de desarrollo config/envirome
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            'exampleactionmailer@gmail.com',
  password:             'ejemplo1234',
  authentication:       'plain',
  enable_starttls_auto: true  }

#Previsualizar emails enviados en test/mailers/previews/user_mailer_preview.rb

class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end
end