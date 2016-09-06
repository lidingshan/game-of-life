class LifeGame

    def next_generation(world_creation)
        life = Marshal.load(Marshal.dump(world_creation))

        world_creation.each_with_index { |row, row_index|
            row.each_with_index { |cell, index|
                live_neighbour_count = 0

                live_neighbour_count += (index > 0 ? row[index-1] : 0)

                live_neighbour_count += (index < row.size-1 ? row[index+1] : 0)

                live_neighbour_count += (row_index > 0 ? world_creation[row_index-1][index] : 0)

                live_neighbour_count += (row_index < world_creation.size-1 ? world_creation[row_index+1][index] : 0)

                live_neighbour_count += (row_index > 0 && index > 0 ? world_creation[row_index-1][index-1] : 0)

                live_neighbour_count += (row_index > 0 && index < row.size-1 ? world_creation[row_index-1][index+1] : 0)

                live_neighbour_count += (row_index < world_creation.size-1 && index < row.size-1 ? world_creation[row_index+1][index+1] : 0)

                live_neighbour_count += (row_index < world_creation.size-1 && index > 0 ? world_creation[row_index+1][index-1] : 0)

                if live_neighbour_count < 2 || live_neighbour_count > 3
                    life[row_index][index] = 0
                end

                if live_neighbour_count == 3
                    life[row_index][index] = 1
                end
            } 
        }



        return life
    end
end