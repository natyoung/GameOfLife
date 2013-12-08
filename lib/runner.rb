#!/usr/bin/env ruby

require_relative 'cell'
require_relative 'point'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize(rows, columns, generations)
    @seeds = []
    @world = World.new(rows, columns, @seeds)
    @world.randomly_seed
    @game = Game.new(@world, generations, Printer.new)
    @game.run
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.length == 3
    GameOfLife.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i)
  else
    puts 'usage: ./runner.rb [rows] [columns] [generations]'
  end
end
# ./runner.rb
