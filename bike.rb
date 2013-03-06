class Bike


  def  initialize (bike_id, functioning)
    @bike_id, @functioning = bike_id, functioning
  end

  def break!
     @functioning = false 
  end

  def functioning?
    @functioning
  end

  def fix!
    @functioning = true
  end

  def to_s
   "The bike id is:#{@bike_id} The status of the bike is: #{@functioning}"
  end
end