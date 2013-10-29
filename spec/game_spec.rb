require_relative '../world'
require_relative '../game'
require_relative '../cell'
require_relative '../printer'

describe Game do
  let (:world) { World.new(5, 8, []) }
  let(:game) { Game.new(world, 1, Printer.new) }
  subject { game }

  before(:each) do
    subject.world.cells.each { |cell| cell.alive = false}
  end

  context 'Any live cell with fewer than two live neighbours dies.' do

    it 'should kill a cell with 0 live neighbors' do
      subject.world.matrix[0][2].alive = true
      subject.tick!
      subject.live_list.size.should == 0
    end

    it 'should kill a cell with 1 live neighbor' do
      subject.world.matrix[1][1].alive = true
      subject.world.matrix[1][2].alive = true
      subject.tick!
      subject.live_list.size.should == 0
    end

  end

  context 'Any live cell with two or three live neighbours lives on to the next generation.' do

    it 'should not kill a cell with 2 live neighbors' do
      subject.world.matrix[1][1].alive = true
      subject.world.matrix[2][0].alive = true
      subject.world.matrix[2][1].alive = true
      subject.world.matrix[3][6].alive = true
      subject.tick!
      subject.live_list.include?(subject.world.matrix[1][1]).should be_true
      subject.live_list.include?(subject.world.matrix[2][0]).should be_true
      subject.live_list.include?(subject.world.matrix[2][1]).should be_true
      subject.live_list.include?(subject.world.matrix[1][0]).should be_true
      subject.live_list.size.should == 4
    end

    it 'should kill a cell with more than three live neighbors' do
      subject.world.matrix[0][0].alive = true
      subject.world.matrix[0][1].alive = true
      subject.world.matrix[0][2].alive = true
      subject.world.matrix[1][0].alive = true
      subject.world.matrix[1][1].alive = true
      subject.tick!
      subject.live_list.include?(subject.world.matrix[0][0]).should be_true
      subject.live_list.include?(subject.world.matrix[0][2]).should be_true
      subject.live_list.include?(subject.world.matrix[1][0]).should be_true
      subject.live_list.include?(subject.world.matrix[1][2]).should be_true
      subject.live_list.include?(subject.world.matrix[4][1]).should be_true
      subject.live_list.size.should == 5
    end

  end

  context 'Any dead cell with exactly three live neighbours becomes a live cell.' do

    it 'should revive a cell with three live neighbors' do
      subject.world.matrix[0][0].alive = true
      subject.world.matrix[0][1].alive = true
      subject.world.matrix[1][0].alive = true
      subject.world.matrix[1][1].alive?.should be_false
      subject.tick!
      subject.live_list.include?(subject.world.matrix[1][1]).should be_true
    end

  end

end