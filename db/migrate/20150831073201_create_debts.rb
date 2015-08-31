
class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :amount
      t.text :comment
      t.integer :owner_id
      t.integer :payer_id
      t.date :start_date
      t.date :due_date
      t.date :paid_date

      t.timestamps null: false
    end

    add_index :debts, :owner_id
    add_index :debts, :payer_id
  end
end
