class ApplicationMailer < ActionMailer::Base
  default from: 'events@meetup.com'
  layout 'mailer'
end
