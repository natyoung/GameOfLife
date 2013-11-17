class World
  attr_reader :matrix

  def initialize(rows, columns, live_cells)
    @rows = rows
    @columns = columns
    @neighbor_positions = [[-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1], [-1, -1], [0, -1], [1, -1]]
    rebuild(live_cells)
  end

  def seed(live_cells)
    live_cells.each do |cell|
      @matrix[cell.x][cell.y].revive_cell
    end
  end

  def find_alive_neighbors(x, y)
    @neighbor_positions.select do |nx, ny|
      neighbor = @matrix[(x + nx) % @rows][(y + ny) % @columns]
      (!neighbor.nil? && neighbor.cell_alive?)
    end
  end

  def rebuild(live_cells)
    @matrix = build_matrix(@rows, @columns)
    seed(live_cells)
  end

  def points
    @matrix.flatten
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
