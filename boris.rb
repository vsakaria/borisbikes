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
      @people = []

     createStation
     createPeople
     rentBike
     rideBike #here bikes are randomly broken
     returnBike
     pickUpBrokenBikes
     delieverbrokenbikes
     fixbikes
     collectbikes
     dockbike

  end

  def createStation
     @station = Station.new
      
      10.times do |i| 
        @station << Bike.new(i + 1, true)   
      end 
      puts("All the bikes have been created!!!\n\n")
      @station.bikes.each{|bike| puts bike }
  end

  def createPeople
    
    10.times do |i| 
      @people << Person.new(i + 1, rand(2).zero?)
    end

    puts("\nAll the people have been created!!!\n\n")
    @people.each{|person| puts person }

  end

  def rentBike
   
    @people.each do |person|
    person.bike = @station.release_bike if person.status
    end 
   
    puts "\nThese people have rented bikes \n\n"
    @people.each { |person| puts person if person.bike }   
  end

  def rideBike
      @people.each{ |person| person.rideBike if person.bike }
      
     puts "\nI want to ride my bicycle!!! These bikes are broken \n\n"
     @people.each do |person|
     puts person.bike if person.bike && !person.bike.functioning?
     end
    
  end

  def returnBike
    
      @people.each do |person|
      @station << person.return_bike if person.bike
      end

      puts "\nThese bikes have been returned \n\n"

      @station.bikes.each{|bike| puts bike }
    
  end

  def pickUpBrokenBikes 

    @station.bikes.each do |bike| 
      @van << @station.bikes.pop if !bike.functioning?
     end
    
    puts "\nThese bikes are broken and have been put into van\n\n"
    @van.bikes.each{|bike| puts bike}
  
  end

  def delieverbrokenbikes
    @van.bikes.count.times { @garage<<( @van.removebike )}
    puts "\nThese bikes have been put into Garage \n\n"
    @garage.bikes.each{ |bike| puts bike} 
  end 

  def fixbikes
    @garage.fixbikes
    puts "\nThese bikes have been fixed and are ready for colection\n\n"
    @garage.bikes.each{|bike| puts bike}
  end

  def collectbikes
      
      @garage.bikes.count.times { @van << @garage.realeasebikes} 
      puts "\nExcellent now we have collected the broken bikes and are heading back to the station\n\n"
      @van.bikes.each{|bike| puts bike}
      
  end

  def dockbike 
      puts "\nGreat so these are the bikes in the station now\n\n"
      @station.bikes.each{|bike| puts bike}

      @van.bikes.count.times{ @station<< @van.removebike}
      puts "\nNow we have all are fixed bikes back\n\n"
      @station.bikes.each{|bike| puts bike}
  end 
end 

c = Control.new


