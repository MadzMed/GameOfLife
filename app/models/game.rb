require_relative "board.rb"

module GameOfLife
  class Game
    attr_reader :matrix, :iteration
    def initialize(input, iteration)
      @matrix = MyMatrix.new(input)
      @iteration = iteration
    end

    def run
      new_mat = @matrix
      new_mat.display
      p "--------------------------------------------------------------------------------------------------------------"
      @iteration.times do
        new_mat = new_mat.next_iteration
        new_mat.display
        p "--------------------------------------------------------------------------------------------------------------"
      end
    end
  end

  class MyMatrix
    attr_reader :matrix, :rows, :columns

    def initialize(input)
      @matrix = matrix_cells(input)
      @rows = @matrix.size
      @columns = @matrix.first.size
    end

    def next_iteration
      i = 0
      new_matrix = []
      @matrix.each do |row|
        j = 0
        new_row = []
        row.each do |cell|
          if cell.count_neighboors_alived > 3 || cell.count_neighboors_alived < 2
            new_row << 0
          elsif cell.count_neighboors_alived == 3
            new_row << 1
          else

            new_row << cell.cell
          end
          j += 1
        end
        new_matrix << new_row
        i += 1
      end
      MyMatrix.new(new_matrix)
    end

    def display(matrix = @matrix)
      matrix.each { |row| p row.map {|cell| cell.cell }.join(", ") }
    end

    def matrix_cells(input)
      input.map.with_index { |row, i| row.map.with_index { |cell, j| MyCell.new(self, cell, i, j) } }
    end
  end

  class MyCell
    attr_reader :cell, :matrix, :x, :y
    def initialize( matrix, cell, x, y)
      @matrix = matrix
      @cell = cell
      @alive = @cell == 1
      @x = x
      @y = y
    end

    def alive?
      @alive
    end

    # find each neighboors of a current cell

    def neighboors
      coordneighboors = [@x - 1, @x, @x + 1].product([@y - 1, @y, @y + 1])
      coordneighboors.delete([@x, @y])
      coordneighboors.select { |coord| coord[0] >= 0 && coord[0] < @matrix.rows && coord[1] >= 0 && coord[1] < @matrix.columns }
    end

    def count_neighboors_alived
      coordneighboors = neighboors
      count = 0
      coordneighboors.each do |coord|
        count += 1 if @matrix.matrix[coord[0]][coord[1]].cell == 1
      end
      count
    end
  end
end
