require './config/environment.rb'

class FlightFinder::CLI

  attr_accessor :request, :scraper, :flight

  def initialize
    @request = FlightFinder::Request.new
    @scraper = FlightFinder::Scraper.new
  end

  def call
    self.request.get_request
    self.scraper.run(self.request)
    self.request.get_details
    self.scraper.show_details(self.request.flight_num)
    puts self.scraper.url
  end

end
