class Printer

  def print_matrix(matrix)
    matrix.each do |x|
      x.each do |cell|
        print cell.alive? ? "*" : " "
      end
      puts "\n"
    end
    puts "\n"
  end
end
