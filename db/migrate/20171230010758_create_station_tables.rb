class CreateStationTables < ActiveRecord::Migration[5.0]
  def change
     create_table :stations do |table|
      table.string :stations
    end
  end
end
