class LifeGame

    attr_reader :cells

    def initialize(creation)
        @cells = creation

        @cells.collect! { |cell|
            cell = 0
        }
    end
end