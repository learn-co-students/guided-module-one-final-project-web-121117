require 'open-uri'
require 'colorize'

class CommandLineInterface

  def greet
    puts "\nWelcome to TrainFinder, the command line solution to for your MTA train-finding needs!"
  end

  def options
    puts "\nChoose from one of the following options:"
    puts "     List All Stations".colorize(:color => :blue)
    puts "     List All Trains".colorize(:color => :blue)
    puts "     Find Stations Trains ".colorize(:color => :blue)
    puts "     Find Trains Stations".colorize(:color => :blue)
    puts "     See Train Map".colorize(:color => :blue)
    puts "     See MTA Map".colorize(:color => :blue)
    puts "     Exit".colorize(:color => :blue) + " and say goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def all_stops
    Stop.all.collect {|stop| stop.name}
  end

  def all_tubes
    Tube.all.collect {|tube| tube.name + " Train"}.sort!
  end

  def pre_find_station
    puts "\n Which station are you looking for?"
    puts all_stops
    puts "\nType selection here:"
  end

  def find_station(input)
    result = Stop.find_by(name: input)
    if result
      result
    else
      puts "That is not a station. Please try another one."
      new_input = gets.chomp
      find_station(new_input)
    end
  end

  def find_trains(station)
    station.tubes
  end

  def show_trains(trains)
    trains.map {|train| puts train.name + " Train"}
  end

  def pre_find_train
    puts "\n Which train are you looking for?"
    puts all_tubes
    puts "\nType selection here:"
  end

  def find_train(tube)
    searched_tube = Tube.find_by(name: tube)
    if searched_tube
      searched_tube
    else
      puts "This is not currently a train line. Try again"
      new_stop = gets.chomp
      find_train(new_tube)
    end
  end

  def find_stations(tube)
    tube.stops
  end

  def show_stations(stations)
    stations.collect {|station| puts station.name}
  end

  def manager_access_prompt
    puts "\nChoose from one of the follow options to proceed:"
    puts "     List All Stations".colorize(:color => :red)
    puts "     List All Trains".colorize(:color => :red)
    puts "     Find Train".colorize(:color => :red)
    puts "     Create Train".colorize(:color => :red)
    puts "     Create Station".colorize(:color => :red)
    puts "     Remove Train".colorize(:color => :red)
    puts "     Update Train URL".colorize(:color => :red)
    puts "     Delete Train".colorize(:color => :red)
    puts "     Delete Station".colorize(:color => :red)
    puts "     Main Menu".colorize(:color => :red)
    puts "     Exit".colorize(:color => :red)
    puts "\nInput choice here:"
  end

  def run
    input = options

    if input == 'list all stations'
      puts all_stops
      puts "\n"
      run
    elsif input == 'list all trains'
      puts all_tubes
      puts "\n"
      run
    elsif input == 'find stations trains'
      pre_find_station
      new_input = gets.chomp
      station = find_station(new_input)
      tubes = find_trains(station)
      show_trains(tubes)
      puts "\n"
      run
    elsif input == 'find trains stations'
      pre_find_train
      new_input = gets.chomp
      tube = find_train(new_input)
      stations = find_stations(tube)
      show_stations(stations)
      puts "\n"
      run
    elsif input == 'see train map'
      pre_find_train
      new_input = gets.chomp
      train = find_train(new_input)
      `open #{train.url}`
      puts "\n"
      run
    elsif input == 'see mta map'
      url = 'http://web.mta.info/maps/submap.html'
      `open #{url}`
      puts "\n"
      run
    elsif input == 'manager access'
      manager_access
    elsif input == 'exit'
      puts "\nUntil next time! Have a great day!".colorize(:color => :blue)
      puts "\n"
    else
      puts "\nThat is not an option. Please try again"
      run
    end
  end

  def manager_access
    manager_access_prompt
    input = gets.downcase.chomp
    if input == 'list all stations'
      puts all_stops
      puts "\n"
      manager_access
    elsif input == 'list all trains'
      puts all_tubes
      puts "\n"
      manager_access
    elsif input == 'find train'
      pre_find_train
      new_input = gets.chomp
      tube = find_train(new_input)
      stations = find_stations(tube)
      show_stations(stations)
      puts "\n"
      manager_access
    elsif input == 'create train'
      puts "\nPlease input name of new train here:"
      name = gets.chomp
      create_new_tube(name)
      puts all_tubes
      puts "\n"
      manager_access
    elsif input == 'create station'
      puts "\nPlease input name of new station here:"
      name = gets.chomp
      create_new_station(name)
      puts all_stops
      puts "\n"
      manager_access
    elsif input == 'remove train'
      puts "\nHere are the current stations:"
      puts all_stops
      puts "\nWhich station would you like to remove a train from:"
      station = gets.chomp
      current_station = find_station(station)
      puts "\nHere are the current trains at #{current_station.name}"
      trains = find_trains(current_station)
      show_trains(trains)
      puts "\nWhich train would you like to remove:"
      train = gets.chomp
      current_train = find_train(train)
      remove_train(current_station, current_train)
      puts "\n#{current_train.name} was successfully removed from #{current_station.name}:"
      puts "\n"
      manager_access
    elsif input == 'update train url'
      puts "\nHere are the current trains"
      puts all_tubes
      puts "\n\nPlease input name of train to update url to:"
      train_input = gets.chomp
      puts "\nPlease input url:"
      url_input = gets.chomp
      update_url(train_input, url_input)
      puts "\nSuccessfully updated"
      puts "\n"
      manager_access
    elsif input == 'delete station'
      puts "\nHere are the current stations."
      puts all_stops
      puts "\nPlease input name of station to delete from database:"
      station_input = gets.chomp
      delete_station(station_input)
      puts "\nSuccessfully Deleted"
      manager_access
    elsif input == 'delete train'
      puts "\nHere are the current trains in the MTA."
      puts all_tubes
      puts "\n\nPlease input name of the train to delete from database:"
      train_input = gets.chomp
      delete_train(train_input)
      puts "\nSuccessfully Deleted"
      manager_access
    elsif input == 'exit'
      puts "\nUntil next time! Have a great day!".colorize(:color => :blue)
      puts "\n"
    elsif input == 'main menu'
      run
    else
      puts "\nThat is not an option. Going Main Menu!"
      run
    end
  end

  def create_new_station(name)
    station = Stop.create do |s|
      s.name = name
    end
  end

  def create_new_tube(name)
    tube = Tube.create do |t|
      t.name = name
      t.url = nil
    end
  end

  def update_url(name, url)
    tube = Tube.find_by(name: name)
    tube.url = url
    tube.save
  end

  def remove_train(current_station, current_train)
    removed_train = TubeStop.find_by(stop_id: current_station.id, tube_id: current_train.id)
    removed_train.destroy
  end

  def delete_station(name)
    stop = Stop.find_by(name: name)
    stop.destroy
  end

  def delete_train(name)
    tube = Tube.find_by(name: name)
    tube.destroy
  end
end
