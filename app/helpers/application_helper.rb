module ApplicationHelper
  def bootstrap_class_for flash_type
    types = HashWithIndifferentAccess.new({ 
      success: "alert-success", 
      error: "alert-danger", 
      alert: "alert-warning", 
      notice: "alert-info" })
    types[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    # byebug
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
