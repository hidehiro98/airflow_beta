class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.accepted.subject
  #
  def accepted(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.rejected.subject
  #
  def rejected(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.commented.subject
  #
  def commented(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.canceled.subject
  #
  def canceled(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end

  def created(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end

  def destroyed(request)
    @request = request
    mail to: @request.user.email, subject: default_i18n_subject(id: @request.id)
  end
end
