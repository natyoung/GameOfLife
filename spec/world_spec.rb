require_relative '../lib/world'
require_relative '../lib/point'
require_relative '../lib/cell'

describe World do
  let(:world) { World.new(5, 8, []) }
  subject { world }

  before(:each) do
    subject.matrix.flatten.each { |p| p.kill_cell }
  end

  it 'should have a 2D array of Points' do
    subject.matrix[4][7].is_a?(Point).should be_true
  end

  it 'should initialise with all dead Cells' do
    subject.matrix.flatten.each { |p| p.cell_alive?.should be_false }
  end

  describe '.seed' do
    it 'should bring the seed Cells to life' do
      seeds = [Cell.new(1, 0), Cell.new(0, 2)]
      subject.seed(seeds)
      subject.matrix[1][0].cell_alive?.should be_true
      subject.matrix[0][2].cell_alive?.should be_true
      subject.matrix[1][1].cell_alive?.should be_false
    end
  end

  describe '.get_neighbor_cell_count' do

    it 'should detect Cell to north' do
      subject.seed([Cell.new(1, 2)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to south' do
      subject.seed([Cell.new(3, 2)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to east' do
      subject.seed([Cell.new(2, 3)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to west' do
      subject.seed([Cell.new(2, 1)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to north-east' do
      subject.seed([Cell.new(1, 1)])
      subject.find_alive_neighbors(2, 0).size.should == 1
    end
    it 'should detect Cell to north-west' do
      subject.seed([Cell.new(1, 1)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to south-east' do
      subject.seed([Cell.new(3, 3)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end
    it 'should detect Cell to south-west' do
      subject.seed([Cell.new(3, 1)])
      subject.find_alive_neighbors(2, 2).size.should == 1
    end

    it 'should not detect neighbors around lone Cell' do
      seeds = [Cell.new(0, 0)]
      subject.seed(seeds)
      subject.find_alive_neighbors(2, 2).size.should == 0
    end

    it 'should be infinite' do
      seeds = [Cell.new(4, 7), Cell.new(4, 0), Cell.new(0, 7), Cell.new(4, 1)]
      subject.seed(seeds)
      subject.find_alive_neighbors(0, 0).size.should == 4
    end
  end
end
