class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@airflow.example'
  layout 'mailer'
end
