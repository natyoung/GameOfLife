class World
  attr_reader :rows, :columns, :matrix

  def initialize(rows, columns, live_cells)
    @rows = rows
    @columns = columns
    @neighbor_positions = [[-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1], [-1, -1], [0, -1], [1, -1]]
    @matrix = build_matrix(@rows, @columns)
    regenerate(live_cells)
  end

  def find_alive_neighbors(x, y)
    @neighbor_positions.select do |nx, ny|
      neighbor = point((x + nx) % @rows, (y + ny) % @columns)
      (!neighbor.nil? && neighbor.cell_alive?)
    end
  end

  def regenerate(live_cells)
    @matrix.flatten.each { |p| p.kill_cell }
    seed(live_cells)
  end

  def seed(live_cells)
    live_cells.each do |cell|
      point(cell.x, cell.y).revive_cell
    end
  end

  def point(x, y)
    @matrix[x][y]
  end

  def points
    @matrix.flatten
  end

  def randomly_seed
    live_cells = []
    @matrix.each do |x|
      x.each { |p| live_cells << Cell.new(p.x, p.y) if [true, false].sample }
    end
    seed(live_cells)
  end

  def remove_ant(ant)
    point(ant.x, ant.y).remove_ant(ant)
  end

  def insert_ant(ant)
    point(ant.x, ant.y).add_ant(ant)
  end

  def black_at?(x, y)
    point(x, y).colour == :black
  end

  def white_at?(x, y)
    point(x, y).colour == :white
  end

  def paint_black(x, y)
    point(x, y).colour = :black
  end

  def paint_white(x, y)
    point(x, y).colour = :white
  end

  private

  def build_matrix(rows, columns)
    Array.new(rows) do |x|
      Array.new(columns) do |y|
        Point.new(x, y)
      end
    end
  end
end
