class Person

  attr_accessor :bike
  #bike and bike= methods are created to get and set repectivitly 

  def initialize(id , status)
    @id, @status = id, status
  end

  def needs_bike?
    @status
  end 



  def has_bike
    @status
  end

  def rides_bike
    #rand(4).odd? ? puts {"I like to ride my Bycle I like to ride it fast" }: puts {"Haaaaaaallllllllllaaaaaaa"}
    @bike.break! if rand(2).odd?
  end  

  def rent_bike(station)
    @bike = station.release_bike
  end

  def return_bike
    returned_bike = @bike
    @bike = nil
    returned_bike
  end             

  def to_s
   "The persons id is: #{@id} - The status of the person is: #{@status} - The bike assign to is: #{@bike ? @bike : "No bike assigned"}"
  end

end