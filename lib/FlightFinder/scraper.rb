require './config/environment.rb'

class FlightFinder::Scraper
  attr_accessor :url

  def run(request, flight)
    create_url(request)
    make_flight(flight)
  end

  def create_url(request)
    if request.legs == 1
      if request.start_state.is_a? String
        if request.end_state.is_a? String
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_state}#{request.start_country}/#{request.end_city}-#{request.end_state}-#{request.end_country}/#{request.start_date}/no-return"
        else
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_state}-#{request.start_country}/#{request.end_city}-#{request.end_country}/#{request.start_date}/no-return"
        end
      else
        if request.end_state.is_a? String
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_country}/#{request.end_city}-#{request.end_state}-#{request.end_country}/#{request.start_date}/no-return"
        else
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_country}/#{request.end_city}-#{request.end_country}/#{request.start_date}/no-return"
        end
      end
    else
      if request.start_state.is_a? String
        if request.end_state.is_a? String
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_state}#{request.start_country}/#{request.end_city}-#{request.end_state}-#{request.end_country}/#{request.start_date}/#{request.end_date}"
        else
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_state}-#{request.start_country}/#{request.end_city}-#{request.end_country}/#{request.start_date}/#{request.end_date}"
        end
      else
        if request.end_state.is_a? String
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_country}/#{request.end_city}-#{request.end_state}-#{request.end_country}/#{request.start_date}/#{request.end_date}"
        else
          self.url = "https://www.kiwi.com/us/search/#{request.start_city}-#{request.start_country}/#{request.end_city}-#{request.end_country}/#{request.start_date}/#{request.end_date}"
        end
      end
    end
  end

  def make_flight(flight)
    flight.price = "$ 709"
    flight.go_airlines = "Thomas Cook Airlines, Ryan Air"
    flight.go_depart_time = "4:25 PM"
    flight.go_arrive_time = "3:20 PM"
    flight.go_date = "Sun Sep 9"
    flight.go_airports = "Seattle (SEA) - Berlin (SXF)"
    flight.return_airlines = "easyJet, Norwegian International, Norwegian Air UK"
    flight.return_depart_time = "7:00 PM"
    flight.return_arrive_time = "11:45 AM"
    flight.return_date = "Tue Sep 25"
    flight.return_airports = "Berlin (TXL) - Seattle (SEA)"
  end

end
