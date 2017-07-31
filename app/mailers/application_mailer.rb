class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@airflow.com'
  layout 'mailer'
end
