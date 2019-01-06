class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :cuit
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
