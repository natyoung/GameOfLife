class Game

  def initialize(world, seeds)
    @world = world
    @world.seed(seeds)
  end
end