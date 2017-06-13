module CardHelper
  def receiver_status_mi(status)
    case status
    when 'accepted' then 'done'
    when 'rejected' then 'close'
    when 'commented' then 'arrow_back'
    end
  end

  def close_button_class(status)
    case status
    when 'accepted' then 'btn-success'
    else 'btn-info'
    end
  end
end
