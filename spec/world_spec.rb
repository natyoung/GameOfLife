require_relative '../lib/world'
require_relative '../lib/cell'

describe World do
  let(:world) { World.new(5, 8, []) }
  subject { world }

  before(:each) do
    subject.matrix.flatten.each { |c| c.alive = false }
  end

  it 'should have a 2D array of Cells' do
    subject.matrix[4][7].is_a?(Cell).should be_true
  end

  it 'should initialise with all dead Cells' do
    subject.matrix.flatten.each { |c| c.alive?.should be_false }
  end

  describe '.seed' do
    it 'should bring the seed Cells to life' do
      seeds = [Cell.new(1, 0), Cell.new(0, 2)]
      subject.seed(seeds)
      subject.matrix[1][0].alive?.should be_true
      subject.matrix[0][2].alive?.should be_true
      subject.matrix[1][1].alive?.should be_false
    end
  end

  describe '.get_neighbor_cell_count' do

    it 'should detect Cell to north' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(1, 2)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to south' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(3, 2)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to east' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(2, 3)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to west' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(2, 1)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to north-east' do
      cell = Cell.new(2, 0)
      subject.seed([Cell.new(1, 1)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to north-west' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(1, 1)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to south-east' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(3, 3)])
      subject.find_alive_neighbors(cell).size.should == 1
    end
    it 'should detect Cell to south-west' do
      cell = Cell.new(2, 2)
      subject.seed([Cell.new(3, 1)])
      subject.find_alive_neighbors(cell).size.should == 1
    end

    it 'should not detect neighbors around lone Cell' do
      cell = Cell.new(2, 2)
      seeds = [Cell.new(0, 0)]
      subject.seed(seeds)
      subject.find_alive_neighbors(cell).size.should == 0
    end

    it 'should be infinite' do
      cell = Cell.new(0, 0)
      seeds = [Cell.new(4, 7), Cell.new(4, 0), Cell.new(0, 7), Cell.new(4, 1)]
      subject.seed(seeds)
      subject.find_alive_neighbors(cell).size.should == 4
    end
  end
end
