class TubeStop < ActiveRecord::Base
  belongs_to :tube
  belongs_to :stop
end
