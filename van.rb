class Van

  attr_accessor :bikes

  def initialize
    @CAPACITY = 8
    @bikes = []
  end

  def << (bike)
    @bikes << bike
  end

  def removebike
    @bikes.pop
  end

  def pick_up(broken_bikes)
    broken_bikes.each{ |bike| @bikes << bike } 
  end

  def deliever_broken_bikes
    @bikes.each.pop
  end 
end