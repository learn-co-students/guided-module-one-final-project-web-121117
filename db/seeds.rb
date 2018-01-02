 # TrainLine.all.delete
 # StationLine.delete_all
 # Station.delete_all

#station_lines - joining table
j = StationLine.create(station_lines: "J")
m = StationLine.create(station_lines: "M")
z = StationLine.create(station_lines: "Z")
q = StationLine.create(station_lines: "Q")
r = StationLine.create(station_lines: "R")

#stations
broad = Station.create(stations: "Broad Street")
wall = Station.create(stations: "Wall Street")
marcy = Station.create(stations: "Marcy Street")
penn = Station.create(stations: "Penn Street")
grand_central = Station.create(stations: "Grand Central Street")

#train_lines
manhattan = TrainLine.create(train_line: "Manhattan")
brooklyn = TrainLine.create(train_line: "Brooklyn")
queens = TrainLine.create(train_line: "Queens")
court = TrainLine.create(train_line: "Court")
bronx = TrainLine.create(train_line: "Bronx")

#Associations
manhattan.station_lines << j  #creating the relationship between train_lines and station_lines
brooklyn.station_lines << m
queens.station_lines << z
court.station_lines << q
bronx.station_lines << r

broad.station_lines << j #creating the relationship between stations and station_lines
#wall.station_lines << z
wall.station_lines << m
#wall.station_lines << j
marcy.station_lines << z
penn.station_lines << q
grand_central.station_lines << r

# require 'rest-client'
# require 'json'
#
# def get_info_from_metro_api(data)
#   #make the web request
#   metro_info = RestClient.get('https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.json?accessType=DOWNLOAD')
#   metro_hash = JSON.parse(data)
#   api = []
#   metro_hash["results"].each do |element|
#     if element["name"] == character
#       element["films"].each {|film| api << film}
#     end
#   end
