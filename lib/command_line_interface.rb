def all_stations
  Station.all.map{|station| station.name}
end

def all_lines
  Line.all.map{|line| line.name}
end

def puts_all(array)
  array.each {|element| puts element}
end

def welcome
  puts "\nWelcome to my first CLI app!\nIt's a collection of train stations and train lines."
  puts "Choose one of the options below to proceede:"
  puts "____________"
end

def input
  print "Type here: "
  user_input = gets.chomp
  puts "\nYou chose: #{user_input}"
  user_input.to_s
end


def main_menu_choice
  puts "\n'List All Stations'"
  puts "'Find Station' to find all of the station's lines"
  puts "'List All Lines'"
  puts "'Find Line' to Find all of the line's stations"
  puts "'MTA' to go to the official MTA website"
  puts "\nExit"
  puts "____________"
  inp = input.downcase #input has a method

  case inp

  when "list all stations"
    puts "List of all stations:"
    puts_all(all_stations.sort)
    all_station_choice
  when "find station"
    find_station
  when "find line"
    find_line
  when "list all lines"
    puts_all(all_lines.sort)
    all_lines_choice
  when "mta"
    exec( "open http://mta.info" )
    main_menu_choice
  when "exit"
    puts "Goodbye!"
  else
    puts "____________"
    puts "Invalid Choice"
    puts "Choose again."
    main_menu_choice #choice has a method
  end
end

def all_station_choice
  puts "\nEnter a station's name to view it's lines (eg.'Delancey St')"
  puts "\nBack"
  puts "Exit"
  inp = input
  inp = inp.split(" ").map {|word| word.capitalize}.join(" ")

  if all_stations.include?(inp)
    station_lines(inp)
    main_menu_choice
  elsif inp.downcase == "exit"
    puts "Goodbye!"
  elsif inp.downcase == "back"
    main_menu_choice
  else
    puts "Unknown command. Try again."
    all_station_choice
  end
end

def all_lines_choice
  puts "\nEnter a line to view it's schedule on the official MTA website (eg.'A','C' etc)"
  puts "\nBack"
  puts "Exit"
  inp = input.upcase

  if inp.downcase == "exit"
    puts "Goodbye!"
  elsif inp.downcase == "back"
    main_menu_choice
  elsif all_lines.include?("#{inp} - Line")
    # line_stations("#{inp} - Line")
    exec("open http://web.mta.info/nyct/service/pdf/t#{inp.downcase}cur.pdf")
    main_menu_choice
  else
    puts "Unknown Line. Try again."
    all_lines_choice
  end
end

def find_line
  puts "____________\nEnter a line to find it's stations:"
  puts "Back\n "
  inp = input.upcase

  if inp.downcase == "back"
    main_menu_choice
  elsif all_lines.include?("#{inp} - Line")
    line_stations("#{inp} - Line")
    main_menu_choice
  else
    puts "Unknown Line! Try again."
    find_line
  end
end

def find_station
  puts "____________\nEnter a station to find out it's lines:"
  puts "Back\n "
  inp = input.downcase
  inp = inp.split(" ").map {|word| word.capitalize}.join(" ")

  if inp.downcase == "back"
    main_menu_choice
  elsif all_stations.include?(inp)
    station_lines(inp)
    main_menu_choice
  else
    puts "Unknown Station! Try again."
    find_station
  end
end

def station_lines(inp)
  puts "____________"
  puts "Lines:"
  Station.find_by(name:inp).lines.each {|line| puts line.name}
end

def line_stations(inp)
  puts "____________"
  puts "Stations:"
  Line.find_by(name:inp).stations.each {|station| puts station.name}
end
