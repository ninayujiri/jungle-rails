# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_confirmation_preview
    UserMailer.order_confirmation(Order.last)
  end
end