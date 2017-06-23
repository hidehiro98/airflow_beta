module CardHelper
  def receiver_status_mi(status)
    case status
    when 'accepted' then 'done'
    when 'rejected' then 'close'
    when 'commented' then 'arrow_back'
    end
  end

  def card_status_class(status)
    case status
    when 'pending' then 'label-default'
    when 'accepted' then 'label-success'
    when 'rejected' then 'label-danger'
    when 'commented' then 'label-warning'
    when 'canceled' then 'label-info'
    end
  end
end
