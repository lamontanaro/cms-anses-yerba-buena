class CreateDockets < ActiveRecord::Migration[5.2]
  def change
    create_table :dockets do |t|
      t.string :description
      t.string :number
      t.integer :states
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
