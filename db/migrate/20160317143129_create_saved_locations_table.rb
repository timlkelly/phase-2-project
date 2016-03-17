class CreateSavedLocationsTable < ActiveRecord::Migration
  def change
    create_table :saved_locations do |t|
      t.references :user, null: false
      t.references :location, null: false
      t.string     :name

      t.timestamps null: false
    end
  end
end
