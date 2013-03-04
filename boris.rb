#!/user/bin/env ruby


##############################################################

class Bike
  def  initialize (bike_id, functioning)
    @bike_id, @functioning = bike_id, functioning
    
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
    @bikes.inspect
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
end


##############################################################

class Control

  def initialize
      station = Station.new
      
      10.times do |i| 
      station << Bike.new(i, true)   
      end 
      puts station.to_s
    
  end

end

c = Control.new


