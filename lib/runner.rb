#!/usr/bin/env ruby

require_relative 'cell'
require_relative 'point'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize
    @seeds = []
    @world = World.new(50, 150, @seeds)
    @world.randomly_seed
    @game = Game.new(@world, 200_000, Printer.new)
    @game.run
  end
end

if $PROGRAM_NAME == __FILE__
  GameOfLife.new
end
# ./runner.rb
