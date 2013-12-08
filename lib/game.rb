class Game
  attr_reader :world, :live_cell_list

  def initialize(world, ants, generations, printer)
    @world = world
    @ants = ants
    @generations = generations
    @live_cell_list = []
    @printer = printer
  end

  def run
    (1..@generations).each do |i|
      @printer.print_matrix(@world.matrix, i)
      tick!
      @ants.each { |a| a.move }
      @world.regenerate(@live_cell_list)
      @live_cell_list = []
      sleep 0.1
    end
  end

  def tick!
    @world.points.each do |point|
      revive_cell_if_conditions_met(point)
    end
  end

  private

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
end
