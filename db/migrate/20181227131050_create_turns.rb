class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.string :number
      t.string :turn_date
      t.string :turn_time
      t.string :place
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
