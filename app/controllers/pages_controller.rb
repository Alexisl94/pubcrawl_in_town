class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def check_notification_message
    current_time = Time.current
    message = []

    if current_time.hour == 12 && current_time.min == 7
      message.push("<li class='notification'>Notification pour 21h</li>")
    elsif current_time.hour == 12 && current_time.min == 8
      message.push("<li class='notification'>Notification pour 22h</li>")
    elsif current_time.hour == 12 && current_time.min == 9
      message.push("<li class='notification'>Notification pour 23h30</li>")
    end

    render plain: "<ul>#{message.join}</ul>"
  end

end
