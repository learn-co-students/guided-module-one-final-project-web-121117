class CreateTrainStations < ActiveRecord::Migration
  def change
    create_table :train_stations do |ts|
      ts.references :station
      ts.references :train
    end
  end
end
