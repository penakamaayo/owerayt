class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :amount
      t.text :comment
      t.references :user, :index => true
      t.date :due_date
      t.date :paid_date

      t.timestamps null: false
    end
  end
end
