class AddChatroomToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :chatroom, null: true, foreign_key: true
  end
end
