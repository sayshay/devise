class AddCarIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :car_id, :integer
  end
end
