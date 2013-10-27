require_relative 'cell'
require_relative 'world'
require_relative 'game'
require_relative 'printer'

class GameOfLife
  def initialize
    @seeds = []
    @world = World.new(50, 150, @seeds)
    @world.matrix.each do |x|
      x.each do |cell|
        cell.alive = [true, false].sample
      end
    end
    @game = Game.new(@world, 2000)
    @game.run
  end
end

#ruby -r "./gol.rb" -e "GameOfLife.new"