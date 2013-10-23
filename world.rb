class World
  attr_reader :matrix, :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @matrix = create_matrix
  end

  def seed(seeds)
    seeds.each do |x, y|
      @matrix[x][y].alive = true
    end
  end

  def get_cell_at(x, y)
    @matrix[x][y]
  end

  def get_all_cells
    @matrix.flatten
  end

  def print_matrix
    2.downto(0) do |x|
      0.upto(2) do |y|
        cell = @matrix[x][y]
        status = cell.alive? ? 'A' : 'D'
        print "[#{cell.x}#{cell.y}#{status}]"
      end
      print "\n"
    end
  end

  private

  def create_matrix
    @matrix = Array.new(@rows) { Array.new(@columns) }
    2.downto(0) do |x|
      0.upto(2) do |y|
        @matrix[x][y] = Cell.new(x, y)
      end
    end
    @matrix
  end

end