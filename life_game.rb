class LifeGame

    attr_reader :cells

    def initialize
        # next_generation(creation)
    end

    def next_generation(creation)
        next_gen_cells = Marshal.load(Marshal.dump(creation))

        creation.each_with_index { |row, row_index|
            row.each_with_index{ |cell, index| 
                live_neighbours_count = 0

                live_neighbours_count += (index > 0 ? row[index-1 ] : 0)
                
                live_neighbours_count += (index+1 < row.size ? row[index+1] : 0)
                
                live_neighbours_count += (row_index > 0 ? creation[row_index-1][index] : 0)
                
                live_neighbours_count += (row_index+1 < creation.size ? creation[row_index+1][index] : 0)

                live_neighbours_count += (row_index > 0 && index > 0 ? creation[row_index-1][index-1] : 0)

                live_neighbours_count += (row_index > 0 && index+1 < row.size ? creation[row_index-1][index+1] : 0)

                live_neighbours_count += (row_index+1 < creation.size && index > 0 ? creation[row_index+1][index-1] : 0)

                live_neighbours_count += (row_index+1 < creation.size && index+1 < row.size ? creation[row_index+1][index+1] : 0)

                if live_neighbours_count < 2 || live_neighbours_count > 3
                    next_gen_cells[row_index][index] = 0
                end

                if live_neighbours_count == 3 
                    next_gen_cells[row_index][index] = 1
                end
            }
        }

        @cells = Marshal.load(Marshal.dump(next_gen_cells))
    end
end