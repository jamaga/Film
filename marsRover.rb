class Planet 
	def initialize
    @grid = [ ]
    10.times do 
      pusta = []
      10.times do
        pusta << ""
      end 
      @grid << pusta
    end
  end

  def save_rover_position(x, y)
    @grid[x][y] = 'r'
  end

  def remove_rover_position(x, y)
    @grid[x][y] = ''
  end

  def check_if_can_move(wsp_x, wsp_y) #czy pod tymi wspolrzednymi znajduje sie rover musi sprawdzac
    if @grid[wsp_x][wsp_y] == 'r' #jesli znajduje sie rower to false bo nie moze sie ruszy cjak noe to true
      return false
    else
      return true
    end
  end

end


class Rover
  def initialize(x, y, direction, planet)
    @x = x
    @y = y
    @direction = direction
    @planet = planet
    @planet.save_rover_position(x, y)

  end


  def move
    @planet.remove_rover_position(@x, @y)
    
    if @direction == 'w'
      @planet.save_rover_position(@x, @y-1) 
      @y = @y - 1
    end

    if @direction == 's'
       @planet.save_rover_position(@x, @y + 1) 
      @y = @y + 1
    end

    if @direction == 'a'
       @planet.save_rover_position(@x - 1, @y) 
      @x = @x - 1
    end

    if @direction == 'd'
       @planet.save_rover_position(@x + 1, @y) 
      @x = @x + 1
    end
  end  

  def turn_left
    if @direction == 'w'
     @direction ='a'

    elsif @direction == 'a' 
     @direction ='s'

    elsif @direction == 's'
      @direction ='d'

    elsif @direction == 'd' 
     @direction ='w'

    end
  end

 def turn_right
    if @direction == 'w'
     @direction ='d'
    
    elsif @direction == 'd'
     @direction ='s'

    elsif @direction == 's' 
     @direction ='a'
    
    elsif @direction == 'a' 
     @direction ='w'
    end
  end


  def off_the_planet?
    raise "The Rover Fell Off the Planet!" if @y < 0 || @x < 0
  end

 

  def handle_obstacle next_position
    if @planet.obstacle? next_position
      @planet.save_rover_position
    else
    next_position
  end
end

end



kata_planet = Planet.new

new_rover = Rover.new(1, 2, 's', kata_planet)

crash_rover = Rover.new(1, 3, 'w', kata_planet)


p crash_rover


p kata_planet.check_if_can_move(2, 3) #wywoluje na planecie bo metoda jest zdef na kalsie planet



