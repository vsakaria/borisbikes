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

  def deliver
  end
end