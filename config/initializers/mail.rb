ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: ENV["GMAIL_ID"] ,
  password: ENV["GMAIL_PASS"] ,
  authentication: 'plain',
  enable_starttls_auto: true
}
