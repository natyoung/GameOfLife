class Point
  attr_reader :x, :y
  attr_accessor :colour, :ants

  def initialize(x, y, colour=:white)
    @x = x
    @y = y
    @cell = Cell.new(@x, @y)
    @colour = colour
    @ants = Set.new
  end

  def cell_alive?
    @cell.alive?
  end

  def kill_cell
    @cell.alive = false
  end

  def revive_cell
    @cell.alive = true
  end

  def add_ant(ant)
    @ants.add(ant)
  end

  def remove_ant(ant)
    @ants.delete(ant)
  end

  def has_ant?(ant)
    @ants.include?(ant)
  end

  def has_ants?
    @ants.size > 0
  end
end