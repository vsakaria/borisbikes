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

  def release_bike
    @bikes.pop
  end

  def report

  end
end