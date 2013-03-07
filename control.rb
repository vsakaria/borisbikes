#!/user/bin/env ruby
require "./person"
require "./garage"
require "./van"
require "./station"
require "./bike"

class Control

  def initialize

      @van = Van.new
      @garage = Garage.new
      @station = Station.new
      @people = []

     create_station
     create_people
     rentBike
     rideBike #here bikes are randomly broken
     returnBike
     pick_up_broken_bikes
     delieverbrokenbikes
     fixbikes
     collectbikes
     dockbike

  end

  def create_station
      
      10.times do |i| 
        @station << Bike.new(i + 1, true)   
      end 
      puts("All the bikes have been created!!!\n\n")
      @station.bikes.each{|bike| puts bike }
  end

  def create_people
    10.times do |i| 
      @people << Person.new(i + 1, rand(2).zero?)
    end

    puts("\nAll the people have been created!!!\n\n")
    @people.each{|person| puts person }

  end

  def rentBike
    @people.each do |person|
      person.rent_bike(@station) if person.needs_bike?
    end 
   
      # person.bike = @station.release_bike if person.status
  
   
    puts "\nThese people have rented bikes \n\n"
    @people.each { |person| puts person if person.bike }   
  end

  def rideBike
    @people.each do |person| 
      person.rides_bike if person.has_bike 
    end
      
    puts "\nI want to ride my bicycle!!! These bikes are broken \n\n"
    @people.each do |person|
      puts person.bike if person.bike && !person.bike.functioning?
    end
  end

  def returnBike
      @people.each do |person|
        @station.recieves_bike(person.return_bike) if person.has_bike
  end

      puts "\nThese bikes have been returned \n\n"
      @station.bikes.each{|bike| puts bike }
  end

  def pick_up_broken_bikes 
    @van.pick_up(@station.release_broken_bikes)
    
    puts "\nThese bikes are broken and have been put into van\n\n"
    @van.bikes.each{|bike| puts bike}
  end

  def delieverbrokenbikes
    @garage.recieve_bikes(@van.deliever_broken_bikes)

    puts "\nThese bikes have been put into Garage \n\n"
    @garage.bikes.each{ |bike| puts bike} 
  end 

  def fixbikes
    @garage.fixbikes
    puts "\nThese bikes have been fixed and are ready for colection\n\n"
    @garage.bikes.each{|bike| puts bike}
  end

  def collectbikes

      #@van.collect_bikes(@garage.release_bikes)
      
      @garage.bikes.count.times { @van << @garage.realeasebikes} 
      puts "\nExcellent now we have collected the broken bikes and are heading back to the station\n\n"
      @van.bikes.each{|bike| puts bike}
      
  end

  def dockbike 
      #@station_recieves_bikes(@van.delivers_bikes)

      puts "\nGreat so these are the bikes in the station now\n\n"
      @station.bikes.each{|bike| puts bike}

      @van.bikes.count.times{ @station<< @van.removebike}
      puts "\nNow we have all are fixed bikes back\n\n"
      @station.bikes.each{|bike| puts bike}
  end 
end 

c = Control.new



