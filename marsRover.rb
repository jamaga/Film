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
  end  
end

kata_planet = Planet.new

new_rover = Rover.new(3, 2, 's', kata_planet)

new_rover.move


p new_rover




