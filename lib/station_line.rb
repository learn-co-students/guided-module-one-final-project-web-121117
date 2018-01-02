class StationLine < ActiveRecord::Base
  belongs_to :train_line
  belongs_to :station
end
