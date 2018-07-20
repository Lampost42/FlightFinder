require './config/environment.rb'

class FlightFinder::Flight
  attr_accessor :go_airlines, :go_depart_time, :go_arrive_time, :go_date, :go_length, :go_airports, :price, :return_airlines, :return_depart_time, :return_arrive_time, :return_date, :return_length, :return_airports
  def make_flight(details)
    details.each{|key, value| self.send(("#{key}="), value)}
    puts "Price: #{self.price}"
    puts "Flight: #{self.go_airports}"
    puts "Departure Date: #{self.go_date}"
    puts "Return Flight: #{self.return_airports}"
    puts "Return Date: #{self.return_date}"
    puts ""
  end


  def detail
    puts ""
    puts "Price: #{self.price}"
    puts ""
    puts "Flight: #{self.go_airports}"
    puts "Departure Date: #{self.go_date}"
    puts "Departure Time: #{self.go_depart_time}"
    puts "Arrival Time: #{self.go_arrive_time}"
    puts "Duration: #{self.go_length}"
    puts "Airlines: #{self.go_airlines}"
    puts ""
    puts "Return Flight: #{self.return_airports}"
    puts "Departure Date: #{self.return_date}"
    puts "Departure Time: #{self.return_depart_time}"
    puts "Arrival Time: #{self.return_arrive_time}"
    puts "Duration: #{self.return_length}"
    puts "Airlines: #{self.return_airlines}"
  end
end
