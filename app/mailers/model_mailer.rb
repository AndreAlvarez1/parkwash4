class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #

  default from: "franciscogutierrezp1967@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Gmail Email')
  end

  # def new_record_notification(record)
  #   @record = record
  #   mail to: "nicoalamo@gmail.com", subject: "¡Successful mail from MailGun!"
  # end
end
