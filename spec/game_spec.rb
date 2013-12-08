require_relative '../lib/world'
require_relative '../lib/game'
require_relative '../lib/point'
require_relative '../lib/cell'
require_relative '../lib/printer'

describe Game do
  let(:world) { World.new(5, 8, []) }
  let(:game) { Game.new(world, [], 1, Printer.new) }
  subject { game }

  before(:each) do
    subject.world.points.each { |p| p.kill_cell }
  end

  context 'Any live cell with fewer than two live neighbours dies.' do
    it 'should kill a cell with 0 live neighbors' do
      subject.world.point(0, 2).revive_cell
      subject.tick!
      subject.live_cell_list.size.should == 0
    end

    it 'should kill a cell with 1 live neighbor' do
      subject.world.point(1, 1).revive_cell
      subject.world.point(1, 2).revive_cell
      subject.tick!
      subject.live_cell_list.size.should == 0
    end
  end

  context 'Any live cell with two or three live neighbours lives on to the next generation.' do
    it 'should not kill a cell with 2 live neighbors' do
      subject.world.point(1, 1).revive_cell
      subject.world.point(2, 0).revive_cell
      subject.world.point(2, 1).revive_cell
      subject.world.point(3, 6).revive_cell
      subject.tick!
      subject.live_cell_list.include?(subject.world.point(1, 1)).should be_true
      subject.live_cell_list.include?(subject.world.point(2, 0)).should be_true
      subject.live_cell_list.include?(subject.world.point(2, 1)).should be_true
      subject.live_cell_list.include?(subject.world.point(1, 0)).should be_true
      subject.live_cell_list.size.should == 4
    end

    it 'should kill a cell with more than three live neighbors' do
      subject.world.point(0, 0).revive_cell
      subject.world.point(0, 1).revive_cell
      subject.world.point(0, 2).revive_cell
      subject.world.point(1, 0).revive_cell
      subject.world.point(1, 1).revive_cell
      subject.tick!
      subject.live_cell_list.include?(subject.world.point(0, 0)).should be_true
      subject.live_cell_list.include?(subject.world.point(0, 2)).should be_true
      subject.live_cell_list.include?(subject.world.point(1, 0)).should be_true
      subject.live_cell_list.include?(subject.world.point(1, 2)).should be_true
      subject.live_cell_list.include?(subject.world.point(4, 1)).should be_true
      subject.live_cell_list.size.should == 5
    end
  end

  context 'Any dead cell with exactly three live neighbours becomes a live cell.' do
    it 'should revive a cell with three live neighbors' do
      subject.world.point(0, 0).revive_cell
      subject.world.point(0, 1).revive_cell
      subject.world.point(1, 0).revive_cell
      subject.world.point(1, 1).cell_alive?.should be_false
      subject.tick!
      subject.live_cell_list.include?(subject.world.point(1, 1)).should be_true
    end
  end
end
