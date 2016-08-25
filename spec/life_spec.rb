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

    before(:each) do
        @game = LifeGame.new
    end

    it 'should die for one live cell' do
        creation = [[1]]
        @game.next_generation(creation)

        expect(@game.cells).to eq([[0]])
    end

    it 'should die when have one live neighbour' do
        creation = [[1, 1]]
        @game.next_generation(creation)
        expect(@game.cells).to eq([[0, 0]])
    end

    it 'should keep live when have two live neighbours on left and right' do
        creation = [[1, 1, 1]]
        @game.next_generation(creation)
        expect(@game.cells).to eq([[0, 1, 0]])
    end

    it 'should die when have one live neighbour in three cells' do
        creation = [[1, 1, 0]]
        @game.next_generation(creation)
        expect(@game.cells).to eq([[0, 0, 0]])
    end

    it 'should keep die when live neighbours are not 3' do
        creation = [[1, 0, 1]]
        @game.next_generation(creation)
        expect(@game.cells).to eq([[0, 0, 0]])
    end

    it 'should keep live when have two live neighbours on top and bottom' do
        creation = [[1], [1], [1]]
        @game.next_generation(creation)
        expect(@game.cells).to eq([[0],[1],[0]])
    end

    it 'should die when only have one live neighbour at top right or bottom left' do
        creation = [[0, 1],
                    [1, 0]]
        @game.next_generation(creation)
        expect(@game.cells).to eq(
            [[0, 0],
             [0, 0]])
    end

    it 'should die when only have live neighbour at top lef or bottom right' do
        creation = [[1, 0],
                    [0, 1]]
        @game.next_generation(creation)
        expect(@game.cells).to eq(
            [[0, 0],
             [0, 0]])
    end

    it 'should live when have just three live neighbours' do
        creation = [
            [1, 1],
            [1, 1]
        ]

        @game.next_generation(creation)
        expect(@game.cells).to eq([
                [1, 1],
                [1, 1]
            ])
    end

    it 'should die when have more than three live neighbours' do
        creation = [
            [1, 1, 1],
            [1, 1, 1]
        ]

        @game.next_generation(creation)
        expect(@game.cells).to eq([
                [1, 0, 1],
                [1, 0, 1]
            ])
    end

    it 'should resurrect if a dead cell have exactly three live neighbours' do
        creation = [
            [1, 0, 1],
            [0, 1, 0]
        ]

        @game.next_generation(creation)
        expect(@game.cells).to eq([
                [0, 1, 0],
                [0, 1, 0]
            ])
    end
end