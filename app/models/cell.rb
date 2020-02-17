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

