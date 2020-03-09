
ENV['MAIL_KEY']
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'dawasa5656@gmail.com',
  password: ENV['MAIL_KEY'],
  authentication: 'plain',
  enable_starttls_auto: true
}