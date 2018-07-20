require './config/environment.rb'

class FlightFinder::Request

  attr_accessor :legs, :start_city, :start_country, :start_state, :start_date, :end_date, :end_city, :end_country, :end_state


  def get_request
    puts "1. One Way"
    puts "2. Return"
    self.legs = gets.strip.to_i
    puts "Where are you leaving from?"
    puts "City:"
    self.start_city = gets.strip.downcase.gsub(" ", "-")
    puts "Country:"
    self.start_country = gets.strip.downcase.gsub(" ", "-")
    if self.start_country == "united-states" || self.start_country == "canada"
      puts "State/Province:"
      self.start_state = gets.strip.downcase.gsub(" ", "-")
    end
    puts "Where do you want to go?"
    puts "City:"
    self.end_city = gets.strip.downcase.gsub(" ", "-")
    puts "Country:"
    self.end_country = gets.strip.downcase.gsub(" ", "-")
    if self.end_country == "united-states" || self.end_country == "canada"
      puts "State/Province:"
      self.end_state = gets.strip.downcase.gsub(" ", "-")
    end
    puts "What day do you want to leave? (yyyy-mm-dd)"
    self.start_date = gets.strip
    if self.legs == 2
      puts "What day do you want to return? (yyyy-mm-dd)"
      self.end_date = gets.strip
    end
  end


end
