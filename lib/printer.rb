require 'set'
require_relative 'ant/ant'
require_relative 'world'
require_relative 'point'
require_relative 'ant/ant_factory'
require_relative 'printer'

class Printer
  def print_matrix(matrix, iteration)
    system 'clear' unless system 'cls'
    matrix.each do |x|
      x.each do |point|
        print_point(point)
      end
      puts "\n"
    end
    puts "Iteration: #{iteration}"
  end

  def print_point(point)
    colour_code = assign_colour_code(point)
    if point.colour == :black
      print colorize('+', colour_code)
    elsif point.cell_alive?
      print '+'
    else
      print colorize(' ', colour_code)
    end
  end

  def assign_colour_code(point)
    cc = 37
    if point.has_ants?
      point.ants.each { |a| cc = a.colour }
    end
    cc
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
