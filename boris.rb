#!/user/bin/env ruby


##############################################################

class Bike
  def  initialize (bike_id, functioning)
    @bike_id, @functioning = bike_id, functioning
  end

  def breakBike
     @functioning = false 
  end

  def to_s
    puts "The bike id is:#{@bike_id} The status of the bike is: #{@functioning}"
  end
end

##############################################################


class Station
  def initialize
    @CAPACITY = 10
    @bikes = [] 
  end

  def << (bike)
    @bikes << bike
  end

  def to_s
    @bikes.to_s
  end

  def release_bike
    @bikes.pop
  end
  
  def report

  end
end

##############################################################

class Van
  def initialize
    @CAPACITY = 4
  end

  def collect
  end

  def deliver
  end
end

##############################################################

class Garage
end

##############################################################



class Person



  def initialize(id , status)
    @id, @status = id, status 
  end

  def assign_bike(bike)
    @bike = bike 
  end

  def bike
    @bike
  end 
    
  def status
    @status
  end

  def rideBike
    rand(4).odd? ? "I like to ride my Bycle I like to ride it fast" : "Haaaaaaallllllllllaaaaaaa"
    rand(4).odd? ? @bike.breakBike : true
  end               

  def to_s
    #Ask teacher how to print the id of bike in few lines could use a block method
    puts "The persons id is: #{@id} - The status of the person is: #{@status} - The bike assign to is: #{@bike ? @bike : "No bike assigned"}"
  end

end


##############################################################

class Control

  def initialize
     createStation
     createPeople
     rentBike
     rideBike
  end

  def createStation
     @station = Station.new
      
      10.times do |i| 
        @station << Bike.new(i + 1, true)   
      end 
      puts @station.to_s
      
  end

  def createPeople
     @people = []
     #How do I refactor this to make it init an array and assign in one line.

    10.times do |i| 
      @people << Person.new(i + 1, rand(2).zero?)
    end

    puts @people.to_s
  end

  def rentBike

    @people.each { |person| person.status ? person.assign_bike( @station.release_bike ) : false }   
    puts "After bike assigned to person"
    @people.each { |person| person.to_s}
   
  end

  def rideBike
    @people.each{ |person| person.bike ? person.rideBike : false}
      puts "After person rides bike"
     @people.each { |person| puts person.bike}
  end
end

c = Control.new


