class World
  attr_reader :matrix

  def initialize(rows=90, columns=180, seeds=[[40,40][41,40][42,40]])
    @rows = rows
    @columns = columns
    @matrix = build_matrix(rows, columns)
    @neighbor_positions = [[-1, 0],[1, 0],[-1, 1],[0, 1],[1, 1],[-1, -1],[0, -1], [1, -1]]
    seed(seeds)
  end

  def seed(seeds)
    seeds.each do |cell|
      cell.alive = true
      @matrix[cell.x][cell.y] = cell
    end
  end

  def count_alive_neighbors(cell)
    @neighbors = []
    @neighbor_positions.each do |nx, ny|
      neighbor = @matrix[(cell.x + nx) % 5][(cell.y + ny)%8]
      @neighbors << neighbor if !neighbor.nil? && neighbor.alive?
    end
    @neighbors
  end

  private

  def build_matrix(rows, columns)
    Array.new(rows) do |x|
      Array.new(columns) do |y|
        Cell.new(x, y)
      end
    end
  end

end