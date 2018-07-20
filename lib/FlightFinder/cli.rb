require './config/environment.rb'

class FlightFinder::CLI

  attr_accessor :request, :scraper, :flight

  def initialize
    @request = FlightFinder::Request.new
    @scraper = FlightFinder::Scraper.new
    @flight = FlightFinder::Flight.new
  end

  def call
    self.request.get_request
    self.scraper.run(self.request, self.flight)
    puts self.scraper.url
    puts self.flight.price
  end

end
