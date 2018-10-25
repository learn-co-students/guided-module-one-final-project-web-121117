require 'open-uri'

class CommandLineInterface
  def greet
    puts 'Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!'
  end

  def check_case(words)
    non_cap = ["at", "corner", "quit", "only"]
    cap = ["sw", "nw", "se", "ne"]
    new_words = words.split
    new_words.map! do |word|
      non_cap.include?(word.downcase) ? word.downcase : cap.include?(word.downcase) ? word.upcase : word.capitalize
    end
    new_words.map! {|word| word == "(exit" ? "(Exit" : word}.join(" ")
  end

  def gets_user_input
    puts "We can help you find which train lines are available at NYC subway stations."
    puts "Enter a subway station to get started:"
    input = check_case(gets.chomp)
  end

  def find_station(input)
    result = Station.find_by(name: input)
    if result
      result
    else
      puts "Could not find this station, Please enter another one or type quit:"
      input = check_case(gets.chomp)
      if input == "quit"
        return done
      end
      find_station(input)
    end
  end

  def find_lines(station)
    station.trains
  end

  def show_lines(trains)
    trains.map { |train| puts train.line + " Train stops here!"}
  end

  def show_stations(line)
    url = Train.find_by(line: line).website
    `open #{url}`
    stations = Train.find_by(line: line).stations
    p stations.map {|station| station.name}
  end

  def done
    puts "Thank you for checking out the NYC subway systems!"
  end

  # def run
  #   greet
  #   input = gets_user_input
  #   station = find_station(input)
  #   lines = find_lines(station)
  #   show_lines(lines)
  # end

end
