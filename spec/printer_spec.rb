require_relative '../printer'
require_relative '../world'
require_relative '../game'
require_relative '../cell'
require 'stringio'

describe Printer do
  let(:printer) { Printer.new() }
  let(:world) { World.new(5, 8, [Cell.new(1,1)]) }
  let(:matrix) { world.matrix }
  subject { printer }

  it 'should print an alive Cell' do
    output = capture_stdout { subject.print_matrix(matrix, 1) }
    output.string.include?('*').should be_true
  end
end

def capture_stdout
  out = StringIO.new
  $stdout = out
  yield
  return out
ensure
  $stdout = STDOUT
end
