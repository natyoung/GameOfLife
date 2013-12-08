class Ant
  attr_reader :x, :y, :colour
  attr_accessor :world, :direction

  def initialize(x, y, world, colour)
    @x = x
    @y = y
    @world = world
    @direction = [1, 0]
    @colour = colour
  end

  def location
    return @x, @y
  end

  def move
    if @world.white_at?(@x, @y)
      @world.paint_black(@x, @y)
      turn_left
    else
      @world.paint_white(@x, @y)
      turn_right
    end
    move_to_next_point
  end

  private

  def turn_right
    dir = [@direction[0], @direction[1]]
    @direction[0] = -1 * dir[1]
    @direction[1] = dir[0]
  end

  def turn_left
    dir = [@direction[0], @direction[1]]
    @direction[0] = dir[1]
    @direction[1] = -1 * dir[0]
  end

  def move_to_next_point
    @world.remove_ant(self)
    @x = (@x += @direction[0]) % @world.rows
    @y = (@y += @direction[1]) % @world.columns
    @world.insert_ant(self)
  end

end