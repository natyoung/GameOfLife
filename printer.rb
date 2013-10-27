class Printer

  def print_matrix(matrix, generation)
    system "clear" unless system "cls"
    matrix.each do |x|
      x.each do |cell|
        print cell.alive? ? '*' : ' '
      end
      puts "\n"
    end
    puts "\nGeneration: #{generation}"
  end
end
