class Station

  attr_reader :bikes 
  
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

  def release_broken_bikes
   @broken_bikes =[]
    @bikes.each do |bike| 
    @broken_bikes << bike if !bike.functioning?
    end

    @broken_bikes
  end

  def recieves_bike(bike)
    @bikes << bike
  end

  def release_bike
    @bikes.pop
  end 

end