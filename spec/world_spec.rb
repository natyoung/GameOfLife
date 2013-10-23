require_relative '../world'
require_relative '../cell'

describe World do
  let(:world) { World.new(3, 3) }
  subject { world }

  before(:each) do
    subject.matrix.each do |row|
      row.each do |cell|
        cell.alive = false
      end
    end
  end

  it 'should have a 2D array of Cells' do
    subject.matrix[0][0].is_a?(Cell).should be_true
  end

  it 'should initialise with all dead Cells' do
    subject.get_all_cells.each do |cell|
      cell.alive?.should be_false
    end
  end

  describe '.seed' do
    it 'should bring the right Cells to life' do
      seeds = [[2, 0], [0,1], [0,2]]
      subject.seed(seeds)
      subject.get_cell_at(2,0).alive?.should be_true
      subject.get_cell_at(0,1).alive?.should be_true
      subject.get_cell_at(0,2).alive?.should be_true
      subject.get_cell_at(1,1).alive?.should be_false
    end
  end
end

