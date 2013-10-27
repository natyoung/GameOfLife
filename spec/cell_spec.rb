require_relative '../cell'

describe Cell do
  let(:cell) { Cell.new(1, 1) }
  subject { cell }

  it 'should initially be dead' do
    cell.alive?.should be_false
  end
end