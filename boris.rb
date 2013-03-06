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
     
     #How do I refactor this to make it init an array and assign in one line.

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
     puts "\n"
  end

  def returnBike
    
    puts "After person returns bike ------------------------------------"
    @people.each do |person|
      @station << person.return_bike if person.bike
    end
    
    puts @station.bikes.inspect
    #puts @station.to_s
    
  end

  def pickUpBrokenBikes
    puts "Check broken bike"
    #puts @station.bikes.inspect
    
    puts "Print station, count: #{@station.bikes.count}"
    puts @station    

    puts "Print van"
    #code smell double call of some bikes see outout
    @station.bikes.each do |bike| 
      if bike.functioning?
        puts "All is good"
      else
        @van << bike
      end
      # puts( bike.functioning? ? "All is good" : @van << (bike) ) 
    end
    
    puts "Print Van Array"
    puts @van.bikes.to_s
  end

  def delieverbrokenbikes
    @van.bikes.count.times { @garage<<( @van.removebike )}
    puts "Status of Van"
    puts @van.inspect

    puts "Bikes in Garage "
    puts @garage.inspect
  end 

  def fixbikes
    @garage.fixbikes
    puts "Bikes after garage"
    puts @garage.inspect
  end

  def collectbikes
      
      @garage.bikes.count.times { @van << @garage.realeasebikes} 
      puts "Bikes being collected"
      puts @van.inspect
  end

  def dockbike 
    @van.bikes.count.times{ @station<< @van.removebike}

      puts "Final Station "
      puts @station.inspect
  end 
end 

c = Control.new


