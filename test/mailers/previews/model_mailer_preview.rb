# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview all emails at http://localhost:3000/rails/mailers/example_mailer
  def sample_mail_preview
    ModelMailer.sample_email(User.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_record_notification
  # def new_record_notification
  #   ModelMailer.new_record_notification
  # end

end
