# require 'rest-client'
# require 'json'

class CommandLineInterface

  def greet
    puts 'Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!'
  end

  def gets_user_input #greet our user
    puts "We can help you find which train lines are available at NYC subway stations."
    puts "Enter a subway station to get started:"
    #what could we put here to allow a user to type a response?
    input = gets.chomp #need an instance to be able to use it out of scope
    #input.to_s
  end #result of this is = to input

  def find_station(input) #grab their input to find their station
   Station.find_by(stations: input)
 end #result of this is = station

  def find_station_lines(station) #calling the relationship between the station and the station line
    station.station_lines
  end #result of this is = show_lines #returns an array

  def show_station_lines(show_lines)
    lines = show_lines.map do |station_lines| #iterating over our array
      station_lines.station_lines#name
    end
    puts "Hello, here are the train line(s) you can take: #{lines.join(" , ")} line(s)."
  end

  def run
    greet
    input = gets_user_input
    station = find_station(input)
    show_lines = find_station_lines(station)
    show_station_lines(show_lines)
  end


end
