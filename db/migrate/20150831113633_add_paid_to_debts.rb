class AddPaidToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :paid, :boolean, :default => false
  end
end
