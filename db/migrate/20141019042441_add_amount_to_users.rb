class AddAmountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount, :decimal, :default => 1000
  end
end
