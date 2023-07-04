class AddPeopleToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :people, :integer
  end
end
