#!/usr/bin/env ruby

require_relative 'cell'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize
    @seeds = []
    @world = World.new(50, 200, @seeds)
    @world.cells.each do |cell|
      cell.alive = [true, false].sample
    end
    @game = Game.new(@world, 200_000, Printer.new)
    @game.run
  end
end

if $0 == __FILE__
  GameOfLife.new
end
# ./gol.rb
