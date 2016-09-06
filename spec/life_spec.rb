require 'rspec'
require './life_game'

RSpec::describe(LifeGame) do
    
    before(:each) do
        @game = LifeGame.new
    end

    it 'one live cell should die' do
        world_creation = [[1]]

        world_evaluation = @game.next_generation(world_creation)
        expect(world_evaluation).to eq([[0]])
    end

    it 'one live cell with one live sibling neighbour should die' do
        world_creation = [[1, 1]]

        world_evaluation = @game.next_generation(world_creation)
        expect(world_evaluation).to eq([[0, 0]])
    end

    it 'one live cell with two sibling neighbours should keep live' do
        world_creation = [[1, 1, 1]]
        world_evaluation = @game.next_generation(world_creation)

        expect(world_evaluation).to eq([[0, 1, 0]])
    end

    it 'one live cell with one live parent neghbour should die' do
        world_creation = [
            [1],
            [1]
        ]

        world_evaluation = @game.next_generation(world_creation)
        expect(world_evaluation).to eq([
                [0],
                [0]
            ])
    end


    it 'one live cell with two live neghbours at top and bottom should live' do
        world_creation = [
            [1],
            [1],
            [1]
        ]

        world_evaluation = @game.next_generation(world_creation)
        expect(world_evaluation).to eq([
                [0],
                [1],
                [0]
            ])
    end

    it 'one live cell with more than three live neighbour should die' do
        world_creation = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]

        world_evaluation = @game.next_generation(world_creation)

        expect(world_evaluation).to eq([
            [1, 0, 1],
            [0, 0, 0],
            [1, 0, 1]
        ])
    end

    it 'one dead cell with exact three live neighbours should resurrect' do
        world_creation = [
            [1, 0],
            [1, 1]
        ]

        world_evaluation = @game.next_generation(world_creation)

        expect(world_evaluation).to eq([
                [1, 1],
                [1, 1]
            ])
    end
end