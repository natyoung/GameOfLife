class AntFactory
  def self.create_ant(x, y, world)
    colour = rand(31..36)
    @ant = Ant.new(x, y, world, colour)
    world.insert_ant(@ant)
    @ant
  end

  def self.create_ants(amount, world)
    @ants = []
    amount.times do
      x = rand(world.rows.to_i)
      y = rand(world.columns.to_i)
      @ants << create_ant(x, y, world)
    end
    @ants
  end
end