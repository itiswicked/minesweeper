# A class that represents an individual cell in the minefield.
class Cell
  attr_reader :row, :column

  def initialize(row, column, contains_mine)
    @revealed = false
    @contains_mine = contains_mine
  end

  def revealed?
    @revealed
  end

  def hidden?
    !@revealed
  end

  def contains_mine?
    @contains_mine
  end

end
