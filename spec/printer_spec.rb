require_relative '../lib/printer'
require_relative '../lib/world'
require_relative '../lib/game'
require_relative '../lib/point'
require_relative '../lib/cell'
require 'stringio'

describe Printer do
  let(:printer) { Printer.new }
  let(:world) { World.new(5, 8, []) }
  let(:matrix) { world.matrix }
  subject { printer }

  before :each do
    world.regenerate([Cell.new(1, 1)])
  end

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
