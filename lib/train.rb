class Train < ActiveRecord::Base
  has_many :train_stations
  has_many :stations, through: :train_stations

  def add_station(station)
    self.stations << station
  end

  def add_website(website)
    self.update(website: website)
  end


end
