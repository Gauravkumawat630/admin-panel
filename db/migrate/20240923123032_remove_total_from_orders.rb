class RemoveTotalFromOrders < ActiveRecord::Migration[7.2]
  def change
    remove_column :orders, :total, :decimal
  end
end
