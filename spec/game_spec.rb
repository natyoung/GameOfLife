require_relative '../world'

describe Game do
  let(:game) { Game.new(World.new(3, 3), [[1,1]]) }
  subject { game }

  context 'Any live cell with fewer than two live neighbours dies, as if caused by under-population.' do

    it 'should kill a cell with 0 live neighbors' do

      cell = game.world.get_cell(1,1)
    end

  end

end