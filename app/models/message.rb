class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates_presence_of :content
  def sender?(a_user)
    user.id == a_user.id
  end

  def admin?(a_user)
    user.nickname == "MASTER"
  end
end
