class Tube < ActiveRecord::Base
  has_many :tube_stops
  has_many :stops, through: :tube_stops
end
