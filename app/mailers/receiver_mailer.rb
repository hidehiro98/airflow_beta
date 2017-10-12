class ReceiverMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receiver_mailer.received.subject
  #
  def received(receiver)
    @receiver = receiver
    mail to: @receiver.user.email, subject: default_i18n_subject(id: @receiver.request.id)
  end

  def edited(receiver)
    @receiver = receiver
    mail to: @receiver.user.email, subject: default_i18n_subject(id: @receiver.request.id)
  end
end
