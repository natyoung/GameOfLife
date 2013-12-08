require_relative '../lib/ant/ant'
require_relative '../lib/world'
require_relative '../lib/cell'
require_relative '../lib/point'
require_relative '../lib/ant/ant_factory'

describe Ant do
  before(:each) do
    @world = World.new(10, 10, [])
    @ant = AntFactory.create_ant(5, 5, @world)
  end

  it 'should be in the world at its starting position' do
    @world.point(5, 5,).ants.include?(@ant).should be_true
  end

  context 'world is initially all white' do
    it 'moves one time' do
      @ant.move
      @world.black_at?(5, 5).should be_true
      @ant.location.should == [5, 4]
      @world.point(5, 4).has_ant?(@ant).should be_true
      @world.point(5, 5).has_ant?(@ant).should == false
    end

    it 'moves two times' do
      2.times { @ant.move }
      @world.black_at?(5, 5).should be_true
      @world.black_at?(5, 4).should be_true
      @ant.location.should == [4, 4]
      @world.point(4, 4).has_ant?(@ant).should be_true
    end

    it 'moves three times' do
      3.times { @ant.move }
      @world.black_at?(5, 5).should be_true
      @world.black_at?(5, 4).should be_true
      @world.black_at?(4, 4).should be_true
      @ant.location.should == [4, 5]
      @world.point(4, 5).has_ant?(@ant).should be_true
    end

    it 'moves three times' do
      4.times { @ant.move }
      @world.black_at?(5, 5).should be_true
      @world.black_at?(5, 4).should be_true
      @world.black_at?(4, 4).should be_true
      @world.black_at?(4, 5).should be_true
      @ant.location.should == [5, 5]
      @world.point(5, 5).has_ant?(@ant).should be_true
    end

  end

  context 'moving off grid' do
    it 'should wrap on y axis' do
      @world.remove_ant(@ant)
      @ant = AntFactory.create_ant(0, 0, @world)
      @ant.move
      @ant.location.should == [0, 9]
      @world.point(0, 9).has_ant?(@ant).should be_true
    end

    it 'should wrap on x axis' do
      @world.remove_ant(@ant)
      @ant = AntFactory.create_ant(0, 0, @world)
      @ant.direction = [0, -1]
      @ant.move
      @ant.location.should == [9, 0]
      @world.point(9, 0).has_ant?(@ant).should be_true
    end
  end

  context 'multiple ants' do
    it 'should allow two ants in the world' do
      @world.point(5, 5).has_ant?(@ant).should be_true
      @ant_2 = AntFactory.create_ant(4, 5, @world)
      @world.point(4, 5).has_ant?(@ant_2).should be_true
    end

    it 'should allow more than one ant in a point' do
      @world.point(5, 5).has_ant?(@ant).should be_true
      @ant_2 = AntFactory.create_ant(5, 5, @world)
      @world.point(5, 5).has_ant?(@ant_2).should be_true
    end
  end
end
