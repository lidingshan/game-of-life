require 'rspec'
require './life_game'
#
#  Conway's Game of Life rule 
# - Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# - Any live cell with more than three live neighbours dies, as if by overcrowding.
# - Any live cell with two or three live neighbours lives on to the next generation.
# - Any dead cell with exactly three live neighbours becomes a live cell.
#

describe "Game of Life" do

    it 'should die for one live cell' do
        creation = [1]
        game = LifeGame.new(creation)

        expect(game.cells).to eq([0])
    end

    it 'should die when have one live neighbour' do
        creation = [1, 1]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([0, 0])
    end
end