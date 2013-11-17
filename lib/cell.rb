class Cell
  attr_reader :x, :y
  attr_accessor :alive

  def initialize(x, y)
    @x = x
    @y = y
    @alive = false
  end

  def alive?
    @alive
  end
end
