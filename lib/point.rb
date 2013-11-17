class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @cell = Cell.new(@x, @y)
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
end