require './config/environment.rb'

class FlightFinder::CLI

  attr_accessor :request, :scraper

  def initialize
    @request = FlightFinder::Request.new
    @scraper = FlightFinder::Scraper.new
  end

  def call
    self.request.get_request
    self.scraper.create_url(self.request)
    puts self.scraper.url
  end

end
