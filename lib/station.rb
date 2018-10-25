class Station < ActiveRecord::Base
  has_many :train_stations
  has_many :trains, through: :train_stations
end
