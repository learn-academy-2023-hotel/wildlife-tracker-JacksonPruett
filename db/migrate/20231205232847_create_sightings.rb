class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.integer :latitude
      t.integer :longitude
      t.string :date

      t.timestamps
    end
  end
end
