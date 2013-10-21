require_relative '../world'
require_relative '../cell'

describe World do
  let(:world) { World.new(3, 3) }
  subject { world }
  it { subject.should respond_to(:matrix) }

  it 'should have a 2D array' do
    subject.matrix[0].is_a?(Array).should be_true
    subject.print_matrix
  end
end