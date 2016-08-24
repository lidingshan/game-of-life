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
        creation = [[1]]
        game = LifeGame.new(creation)

        expect(game.cells).to eq([[0]])
    end

    it 'should die when have one live neighbour' do
        creation = [[1, 1]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([[0, 0]])
    end

    it 'should keep live when have two live neighbours on left and right' do
        creation = [[1, 1, 1]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([[0, 1, 0]])
    end

    it 'should die when have one live neighbour in three cells' do
        creation = [[1, 1, 0]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([[0, 0, 0]])
    end

    it 'should keep die when live neighbours are not 3' do
        creation = [[1, 0, 1]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([[0, 0, 0]])
    end

    it 'should keep live when have two live neighbours on top and bottom' do
        creation = [[1], [1], [1]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq([[0],[1],[0]])
    end

    it 'should keep live when have live neighbours at top right and top left' do
        creation = [[1, 0, 1],
                    [0, 1, 0]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq(
            [[0, 0, 0],
             [0, 1, 0]])
    end

    it 'should keep live when have live neighbours at bottom right and bottom left' do
        creation = [[0, 1, 0],
                    [1, 0, 1]]
        game = LifeGame.new(creation)
        expect(game.cells).to eq(
            [[0, 1, 0],
             [0, 0, 0]])
    end

    xit 'should die when have more than three live neighbours' do
        pending('to be implemented')
    end
end