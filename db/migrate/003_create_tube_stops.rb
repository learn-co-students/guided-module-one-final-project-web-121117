class CreateTubeStops < ActiveRecord::Migration[4.2]
  def change
    create_table :tube_stops do |t|
      t.integer :stop_id
      t.integer :tube_id
    end
  end
end
