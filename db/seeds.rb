require 'rest-client'
require 'json'

metro_data = RestClient.get('https://data.cityofnewyork.us/api/views/he7q-3hwy/rows.json?accessType=DOWNLOAD')
metro_hash = JSON.parse(metro_data)

metro_hash["data"].each do |metro_array|
  stop = metro_array[10]
  tubes = metro_array[12].split("-")

  if !Stop.all.find_by(name: stop)
    current_stop = Stop.create(name: stop)
  else
    current_stop = Stop.all.find_by(name: stop)
  end

  tubes.each do |tube|
    tube_line = Tube.all.find_by(name: tube)
    if tube_line
      current_stop.tubes << tube_line
    else
      new_tube = Tube.create(name: tube)
      current_stop.tubes << new_tube
    end
  end

end
