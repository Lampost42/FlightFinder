require './config/environment.rb'

class FlightFinder::Scraper
  attr_accessor :url, :cheapest, :recommended, :shortest

  def initialize
    @cheapest = FlightFinder::Flight.new
    @recommended = FlightFinder::Flight.new
    @shortest = FlightFinder::Flight.new
  end

  def run(request)
    create_url(request)
    puts "1. Recommended"
    scrape(self.recommended)
    puts "2. Cheapest"
    scrape(self.cheapest)
    puts "3. Shortest"
    scrape(self.shortest)
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

  def scrape(flight)
    details = {}
    case flight
    when self.recommended
      scrape_url = self.url
    when self.cheapest
      scrape_url = self.url + "?sortBy=price"
    when self.shortest
      scrape_url = self.url + "?sortBy=duration"
    end
    details[:price] = "$ 709"
    details[:go_airlines] = "Thomas Cook Airlines, Ryan Air"
    details[:go_depart_time] = "4:25 PM"
    details[:go_arrive_time] = "3:20 PM"
    details[:go_date] = "Sun Sep 9"
    details[:go_airports] = "Seattle (SEA) - Berlin (SXF)"
    details[:go_length] = "13h 55m"
    details[:return_airlines] = "easyJet, Norwegian International, Norwegian Air UK"
    details[:return_depart_time] = "7:00 PM"
    details[:return_arrive_time] = "11:45 AM"
    details[:return_date] = "Tue Sep 25"
    details[:return_airports] = "Berlin (TXL) - Seattle (SEA)"
    details[:return_length] = "25h 45m"
    flight.make_flight(details)
  end

  def show_details(flight_num)
    case flight_num
    when 1
      flight = self.recommended
    when 2
      flight = self.cheapest
    when 3
      flight = self.shortest
    end
    flight.detail
  end

end
