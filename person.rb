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
    @bike.break! if rand(2).odd?
  end  

  def return_bike
    #return_bike = @bike
    #@bike = nil
    #return_bike
    # @bike and remove_instance_variable(:@bike)  
    
    #show to leo
    returned_bike = @bike
    @bike = nil
    returned_bike
  end             

  def to_s
    #Ask teacher how to print the id of bike in few lines could use a block method
   "The persons id is: #{@id} - The status of the person is: #{@status} - The bike assign to is: #{@bike ? @bike : "No bike assigned"}"
  end

end