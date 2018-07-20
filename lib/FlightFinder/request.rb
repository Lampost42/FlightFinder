require './config/environment.rb'

class FlightFinder::Request

  attr_accessor :legs, :start_city, :start_country, :start_state, :start_date, :end_date, :end_city, :end_country, :end_state

end
