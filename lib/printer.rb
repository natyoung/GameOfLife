class Printer

  def print_matrix(matrix, generation)
    system 'clear' unless system 'cls'
    matrix.each do |x|
      x.each do |point|
        print point.cell_alive? ? '*' : ' '
      end
      puts "\n"
    end
    puts "\nGeneration: #{generation}"
  end
end
