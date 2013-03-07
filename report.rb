#!/user/bin/env ruby
require "./control"

class Report

 def initialize
 	@c = Control.new()
 end

 def createreport
  @c.createStation
  @c.createPeople
  @c.rentBike
  @c.rideBike #here bikes are randomly broken
  @c.returnBike
  @c.pickUpBrokenBikes
  @c.delieverbrokenbikes
  @c.fixbikes
  @c.collectbikes
  @c.c.dockbike
 end

end

r = Report.new()
r.createreport