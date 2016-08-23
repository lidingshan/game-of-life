class LifeGame

    attr_reader :cells

    def initialize(creation)
        @cells = Marshal.load(Marshal.dump(creation))

        creation.each_with_index { |row, row_index|
            row.each_with_index{ |cell, index| 
                live_neighbours_count = 0
                if index-1 >= 0 && row[index-1] == 1
                    live_neighbours_count += 1
                end

                if index+1 < row.size && row[index+1] == 1
                    live_neighbours_count += 1
                end

                if live_neighbours_count < 2
                    @cells[row_index][index] = 0
                end
            }
        }
    end
end