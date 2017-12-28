class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |s|
      s.string :name 
    end
  end
end
