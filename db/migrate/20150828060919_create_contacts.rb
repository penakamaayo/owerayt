class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user, :index => true
      t.references :contact, :index => true

      t.timestamps null: false
    end
  end
end
