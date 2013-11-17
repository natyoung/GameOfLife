class Game
  attr_reader :world, :live_cell_list

  def initialize(world, generations, printer)
    @world = world
    @generations = generations
    @live_cell_list = []
    @printer = printer
  end

  def tick!
    @world.points.each do |point|
      revive_cell_if_conditions_met(point)
    end
  end

  def revive_cell_if_conditions_met(point)
    alive_neighbors = @world.find_alive_neighbors(point.x, point.y)
    if point.cell_alive?
      if [2, 3].include?(alive_neighbors.size)
        @live_cell_list << point
      end
    elsif alive_neighbors.size == 3
      @live_cell_list << point
    end
  end

  def run
    (1..@generations).each do |i|
      @printer.print_matrix(@world.matrix, i)
      tick!
      @world.rebuild(@live_cell_list)
      @live_cell_list = []
      sleep 0.1
    end
  end

end
