class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :string, default: "Pending"
  end
end
