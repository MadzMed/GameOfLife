require_relative "cell.rb"

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


# MyMatrix.new(input).display
# MyMatrix.new(input).next_iteration.display

# p MyMatrix.new(input).rows
# p MyMatrix.new(input).matrix
# p MyCell.new(MyMatrix.new(input), input[0][0], 0, 0).count_neighboors_alived
