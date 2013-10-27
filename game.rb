class Game
  attr_reader :world, :kill_list, :live_list

  def initialize(world)
    @world = world
    @kill_list = []
    @live_list = []
  end

  def tick!
    @world.matrix.each do |row|
      row.each do |cell|
        alive_neighbors = @world.count_alive_neighbors(cell)
        if cell.alive?
          if [2, 3].include?(alive_neighbors.size)
            @live_list << cell
          else
            @kill_list << cell
          end
        elsif alive_neighbors.size == 3
          @live_list << cell
        end
      end
    end
  end

end