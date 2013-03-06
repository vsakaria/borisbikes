class Garage

  attr_accessor :bikes
  def initialize 
    @bikes = []
  end

  def << (bike)
    @bikes << bike
  end

  def realeasebikes
    @bikes.pop
  end

  def fixbikes
    @bikes.each{|bike| bike.fix! }
  end
end