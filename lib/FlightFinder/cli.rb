require './config/environment.rb'

class FlightFinder::CLI

  attr_accessor :request

  def initialize
    @request = FlightFinder::Request.new
  end

  def call
    get_request
    create_url
  end

  def get_request
    puts "1. One Way"
    puts "2. Return"
    self.request.legs = gets.strip.to_i
    puts "Where are you leaving from?"
    puts "City:"
    self.request.start_city = gets.strip.downcase
    puts "Country:"
    self.request.start_country = gets.strip.downcase
    if self.request.start_country == "united states"
      puts "State:"
      self.request.start_state = gets.strip.downcase
    end
    puts "Where do you want to go?"
    puts "City:"
    self.request.end_city = gets.strip.downcase
    puts "Country:"
    self.request.end_country = gets.strip.downcase
    if self.request.end_country == "united states"
      puts "State:"
      self.request.end_state = gets.strip.downcase
    end
    puts "What day do you want to leave? (yyyy-mm-dd)"
    self.request.start_date = gets.strip
    if self.request.legs == 2
      puts "What day do you want to return? (yyyy-mm-dd)"
      self.request.end_date = gets.strip
    end
  end

  def create_url
    url = "https://www.kiwi.com/us/search/#{self.request.start_city}-#{self.request.start_country}/#{self.request.end_city}-#{self.request.end_country}/#{self.request.start_city}-#{self.request.start_country}/#{self.request.start_date}/#{self.request.end_date}"
    puts url
  end

end
