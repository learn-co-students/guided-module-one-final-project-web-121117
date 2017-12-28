require 'rest-client'
require 'json'

def train_info
  train_data = RestClient.get('https://data.cityofnewyork.us/api/views/he7q-3hwy/rows.json?accessType=DOWNLOAD')
  train_hash = JSON.parse(train_data)
  stops = []
  train_hash["data"].each do |train_array|
    stops << train_array[12].split("-")
  end
  stops[0..10]
end

train_info
