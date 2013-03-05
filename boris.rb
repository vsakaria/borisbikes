#!/user/bin/env ruby


##############################################################



class Bike

  attr_accessor :functioning

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

  attr_accessor :bikes 
  
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

  attr_accessor :bikes

  def initialize
    @CAPACITY = 8
    @bikes = []
  end

  def addbike(bike)
    @bikes << bike
  end

  

  def deliver
  end
end

##############################################################

class Garage
end

##############################################################



class Person

  attr_accessor :bike
  #bike and bike= methods are created to get and set repectivitly 

  def initialize(id , status)
    @id, @status = id, status
  end

  # def assign_bike(bike)
  #   @bike = bike 
  # end

  # def bike
  #   @bike
  # end 

    
  def status
    @status
  end

  def rideBike
    #rand(4).odd? ? puts {"I like to ride my Bycle I like to ride it fast" }: puts {"Haaaaaaallllllllllaaaaaaa"}
    rand(4).odd? ? @bike.breakBike : true
  end  

  def returnBike
    #return_bike = @bike
    #@bike = nil
    #return_bike
  @bike and remove_instance_variable(:@bike)  
  end             

  def to_s
    #Ask teacher how to print the id of bike in few lines could use a block method
    puts "The persons id is: #{@id} - The status of the person is: #{@status} - The bike assign to is: #{@bike ? @bike : "No bike assigned"}"
  end

end


##############################################################

class Control

  def initialize

      @van = Van.new

     createStation
     createPeople
     rentBike
     rideBike #here bikes are randomly broken
     returnBike
     pickUpBrokenBikes
    

  end

  def createStation
     @station = Station.new
      
      10.times do |i| 
        @station << Bike.new(i + 1, true)   
      end 
      puts @station.inspect
      #puts @station.to_s
      
  end

  def createPeople
     @people = []
     #How do I refactor this to make it init an array and assign in one line.

    10.times do |i| 
      @people << Person.new(i + 1, rand(2).zero?)
    end

    #puts @people.to_s
  end

  def rentBike

    @people.each { |person| person.status ? person.bike=( @station.release_bike ) : false }   
    puts "After bike assigned to person ---------------------------------"
    @people.each { |person| person.to_s}
   
  end

  def rideBike
    @people.each{ |person| person.bike ? person.rideBike : false}
      puts "After person rides bike --------------------------------"
     @people.each { |person| puts (person.bike ?  person.bike : "At home chilling")} 
     puts @station.bikes.inspect
  end

  def returnBike
    
    puts "After person returns bike ------------------------------------"
    @people.each{ |person|  person.bike ? @station << person.returnBike : false }
    
    puts @station.bikes.inspect
    #puts @station.to_s
    
  end

  def pickUpBrokenBikes
    puts "Check broken bike"
    #puts @station.bikes.inspect
    
    puts @station

    
    @station.bikes.each{ |bike| puts( bike.functioning ? "All is good" : @van.addbike(bike) ) } 
  
  end
end

c = Control.new


