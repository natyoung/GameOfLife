#!/usr/bin/env ruby

require_relative 'cell'
require_relative 'point'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize(rows, columns, number_of_ants, generations)
    seeds = []
    world = World.new(rows, columns, seeds)
    world.randomly_seed
    ants = AntFactory.create_ants(number_of_ants, world)
    game = Game.new(world, ants, generations, Printer.new)
    game.run
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.length == 4
    GameOfLife.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i, ARGV[3].to_i)
  else
    puts 'usage: ./runner.rb [rows] [columns] [number of ants] [generations]'
  end
end
# ./runner.rb
