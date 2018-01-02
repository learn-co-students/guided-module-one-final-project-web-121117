class CreateStationLinesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :station_lines do |table|
      table.string :station_lines
      table.integer :train_line_id #storing unique id in our join table
      table.integer :station_id #storing unique id in our join table
    end
  end
end
