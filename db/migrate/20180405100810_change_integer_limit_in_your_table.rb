class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.1]
  def change
    change_column :contacts, :phone_number, :integer, limit: 6
  end
end
