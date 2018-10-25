require 'rest-client'
require 'json'

train_data = RestClient.get('https://data.cityofnewyork.us/api/views/he7q-3hwy/rows.json?accessType=DOWNLOAD')
train_hash = JSON.parse(train_data)

train_hash["data"].each do |train_array|
  station = train_array[10]
  lines = train_array[12].split("-")

  if !Station.all.find_by(name: station)
    current_station = Station.create(name: station)
  else
    current_station = Station.all.find_by(name: station)
  end

  lines.each do |line|
    train_line = Train.all.find_by(line: line)
    if train_line
      current_station.trains << train_line
    else
      new_line = Train.create(line: line)
      current_station.trains << new_line
    end
  end

end
