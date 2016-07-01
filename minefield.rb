require_relative "cell"
require 'pry'

class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count

    build_minefield
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
   @board[row][col].revealed?
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    @board.flatten.any? { |cell| cell.contains_mine? && cell.revealed? }
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    @board.flatten.all? { |cell| !cell.contains_mine? && cell.revealed? }
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)

  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    @board[row][col].contains_mine?
  end

  private

  # Create a data structure within an instance variable that will represent
  # the minefield.
  def build_minefield
    mine_inventory = @mine_count
    @board = (0..@row_count).map do |row|
      (0..@column_count).map do |column|
        contains_mine = mine_inventory > 0 && [true, false].sample
        mine_inventory -= 1 if contains_mine
        Cell.new(row, column, contains_mine)
      end
    end
    binding.pry if mine_inventory > 0
  end

  # Distribute mines amongst the individual minefield cells
  def place_mines

  end

  def adjacent_cells(row, col)
    [
      @board[row - 1][col],
      @board[row + 1][col + 1],
      @board[row][col + 1],
      @board[row + 1][col + 1],
      @board[row + 1][col],
      @board[row -1 ][col + 1],
      @board[row][col],
    ].compact
  end
end
