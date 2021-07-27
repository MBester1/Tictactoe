#
# Basic implementation
#

Player1 = :player1
Player2 = :player2

@grid = {
    'A1' => Player1, 'B1' => Player2, 'C1' => Player1,
    'A2' => Player1, 'B2' => Player2, 'C2' => Player2,
    'A3' => Player1, 'B3' => Player1, 'C3' => Player1,
}

@solutions = [
    ['A1', 'B1', 'C1'], # top across
    ['A2', 'B2', 'C2'], # middle across
    ['A3', 'B3', 'C3'], # bottom across

    ['A1', 'A2', 'A3'], # left down
    ['B1', 'B2', 'B3'], # middle down
    ['C1', 'C2', 'C3'], # right down

    ['A1', 'B2', 'C3'], # right across
    ['A3', 'B2', 'C1'], # left across
]

def winner
  @solutions.each do |positions|
    pos1, pos2, pos3 = positions

    if @grid[pos1].nil?
      # this solution can't have a winner because there's at least one empty position
      next
    end

    # all positions have the same value
    if @grid[pos1] == @grid[pos2] and @grid[pos2] == @grid[pos3]
      return @grid[pos1]
    end
  end

  # no winner was found
  return nil
end

def is_draw?
  @grid.each do |pos, val|
    # we have an empty position, so it can't be a draw
    if val.nil?
      return false
    end
  end

  # it's a draw if no positions are empty and there's no winner
  return winner.nil?
end

puts "Draw? #{is_draw?}"
puts "Winner: #{winner}"