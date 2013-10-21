class World
  attr_reader :matrix, :rows, :columns
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @matrix = create_matrix
  end

  def print_matrix
    @matrix.each do |row|
      row.each do |cell|
        print "[#{cell.x}#{cell.y}]"
      end
      print "\n"
    end
  end

  private

  def create_matrix
    @matrix = Array.new(@rows) do |x|
      Array.new(@columns) do |y|
        Cell.new(y, x)
      end
    end
    @matrix
  end

end
