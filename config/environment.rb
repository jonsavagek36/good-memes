# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# SendGrid E-Mail Set Up
ActionMailer::Base.smtp_settings = {
  :user_name => SENDGRID_NAME,
  :password => SENDGRID_PASSWORD,
  :domain => 'good-memes.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
