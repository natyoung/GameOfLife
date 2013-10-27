class Game
  attr_reader :world, :live_list

  def initialize(world, generations)
    @world = world
    @generations = generations
    @live_list = []
    @printer = Printer.new()
  end

  def tick!
    @world.matrix.each do |row|
      row.each do |cell|
        add_to_live_list_if_conditions_met(cell)
      end
    end
  end

  def add_to_live_list_if_conditions_met(cell)
    alive_neighbors = @world.count_alive_neighbors(cell)
    if cell.alive?
      if [2, 3].include?(alive_neighbors.size)
        @live_list << cell
      end
    elsif alive_neighbors.size == 3
      @live_list << cell
    end
  end

  def run
    (1..@generations).each_with_index do |i|
      system "clear" unless system "cls"
      @printer.print_matrix(@world.matrix, i)
      tick!
      @world.rebuild(@live_list)
      @live_list = []
      sleep 0.1
    end
  end

end