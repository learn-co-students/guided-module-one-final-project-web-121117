f_train = Train.create(line: "F")

f_stations = ["71 Avenue", "Roosevelt Avenue", "Lexington Avenue", "Rockefeller Center", "42 Street", "34 Street", "West 4 Street", "Delancey Street", "East Broadway"]
f_stations.each do |station|
  new_station = Station.create(name: station)
  new_station.trains << f_train
end

e_train = Train.create(line: "E")

e_stations = ["Sutphin Boulevard", "71 Avenue", "Roosevelt Avenue", "Queens Boulevard", "Court Square", "Lexington Avenue", "42 Street", "34 Street", "West 4 Street", "World Trade Center"]
e_stations.each do |station|
  if !Station.all.find_by(name: station)
    new_station = Station.create(name: station)
    new_station.trains << e_train
  else
    Station.find_by(name: station).trains << e_train
  end
end

r_train = Train.create(line: "R")

r_stations = ["71 Avenue", "Woodhaven Boulevard", "Grand Avenue", "Elmhurst Avenue", "Roosevelt Avenue", "Lexington Avenue", "42 Street", "34 Street", "14 Street", "Rector Street"]
r_stations.each do |station|
  if !Station.all.find_by(name: station)
    new_station = Station.create(name: station)
    new_station.trains << r_train
  else
    Station.find_by(name: station).trains << r_train
  end
end

m_train = Train.create(line: "M")
m_stations = ["71 Avenue", "Woodhaven Boulevard", "Grand Avenue", "Elmhurst Avenue", "Roosevelt Avenue", "Queens Boulevard", "Court Square", "Lexington Avenue", "Rockefeller Center", "42 Street", "34 Street", "West 4 Street", "Delancey Street"]
m_stations.each do |station|
  if !Station.all.find_by(name: station)
    new_station = Station.create(name: station)
    new_station.trains << m_train
  else
    Station.find_by(name: station).trains << m_train
  end
end

seven_train = Train.create(line: "7")
seven_stations = ["Main Street", "Junction Boulevard", "Roosevelt Avenue", "Queens Boulevard", "Court Square", "42 Street"]
seven_stations.each do |station|
  if !Station.all.find_by(name: station)
    new_station = Station.create(name: station)
    new_station.trains << seven_train
  else
    Station.find_by(name: station).trains << seven_train
  end
end
