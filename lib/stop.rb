class Stop < ActiveRecord::Base
  has_many :tube_stops
  has_many :tubes, through: :tube_stops
end
