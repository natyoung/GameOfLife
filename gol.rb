require_relative 'cell'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize
    @seeds = []
    @world = World.new(50, 200, @seeds)
    @world.matrix.each do |x|
      x.each do |cell|
        cell.alive = [true, false].sample
      end
    end
    @game = Game.new(@world, 200000, Printer.new)
    @game.run
  end
end

#ruby -r "./gol.rb" -e "GameOfLife.new"