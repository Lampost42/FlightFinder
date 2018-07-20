require './config/environment.rb'

class FlightFinder::Scraper
  attr_accessor :url

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
    puts self.url
  end

end
