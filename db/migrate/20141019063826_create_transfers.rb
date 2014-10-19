class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :user, index: true
      t.decimal :amount
      t.integer :to_user
      t.string :to_email

      t.timestamps
    end
  end
end
