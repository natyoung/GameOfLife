class Printer

  def print_matrix(matrix, generation)
    matrix.each do |x|
      x.each do |cell|
        print cell.alive? ? "*" : " "
      end
      puts "\n"
    end
    puts "\nGeneration: #{generation}"
  end
end
