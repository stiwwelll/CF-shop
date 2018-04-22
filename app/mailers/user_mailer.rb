class UserMailer < ApplicationMailer
  default from: "test@cf-shop.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'fritzkatrin@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
