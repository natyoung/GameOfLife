require_relative '../lib/point'
require_relative '../lib/cell'

describe Point do
  let(:point) { Point.new(5, 5) }
  subject { point }

  it 'should have a dead cell' do
    subject.cell_alive?.should be_false
  end
end