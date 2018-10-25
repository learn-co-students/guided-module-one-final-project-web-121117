require_relative '../config/environment'
require_relative '../lib/command_line_interface'
require 'open-uri'

cli = CommandLineInterface.new
cli.greet

# while true
#   input = cli.gets_user_input
#   station = cli.find_station(input)
#   break if station == nil
#   lines = cli.find_lines(station)
#   cli.show_lines(lines)
# end

cli.show_stations("7")
