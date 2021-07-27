#
# Interactive implementation
#

Player1 = :player1
Player2 = :player2

@grid = {
    'A1' => nil, 'B1' => nil, 'C1' => nil,
    'A2' => nil, 'B2' => nil, 'C2' => nil,
    'A3' => nil, 'B3' => nil, 'C3' => nil,
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
  @solutions.each do |cells|
    cell1, cell2, cell3 = cells

    if @grid[cell1].nil?
      # this solution can't have a winner because there's at least one empty cell
      next
    end

    # all cells have the same value
    if @grid[cell1] == @grid[cell2] and @grid[cell2] == @grid[cell3]
      return @grid[cell1]
    end
  end

  # no winner was found
  return nil
end

def is_draw?
  @grid.each do |cell, val|
    # we have an empty cell, so it can't be a draw
    if val.nil?
      return false
    end
  end

  # it's a draw if no cells are empty and there's no winner
  return winner.nil?
end

def player_name(player)
  case player
  when Player1
    return 'Player 1'
  when Player2
    return 'Player 2'
  else
    return 'Who dis?'
  end
end

def player_symbol(player)
  case player
  when Player1
    return 'X'
  when Player2
    return 'O'
  else
    return '?'
  end
end

def render_grid
  "\n----A---B---C--\n" \
  "1 | #{render_cell('A1')} | #{render_cell('B1')} | #{render_cell('C1')} |\n" \
  "---------------\n" \
  "2 | #{render_cell('A2')} | #{render_cell('B2')} | #{render_cell('C2')} |\n" \
  "---------------\n" \
  "3 | #{render_cell('A3')} | #{render_cell('B3')} | #{render_cell('C3')} |\n" \
  "---------------\n\n"
end

def render_cell(cell)
  value = @grid[cell]
  
  case value
  when nil
    '-'
  when Player1
    player_symbol(Player1)
  when Player2
    player_symbol(Player2)
  else
    '?'
  end
end

def request_choice
  print "Choice: "
  choice = gets.strip.upcase

  unless cell_filled?(choice)
    puts "Oops, #{choice} is already set."
    choice = request_choice
  end

  unless valid_cell?(choice)
    puts "Oops, #{choice} is invalid. You may choose from #{cells}"
    choice = request_choice
  end

  choice
end

def cells
  list = []
  @grid.keys.each do |key|
    list << key.to_s.upcase
  end

  list
end

def valid_cell?(cell)
  cells.include?(cell)
end

def set_cell(cell, value)
  @grid[cell] = value
end

def cell_filled?(cell)
  @grid[cell].nil?
end

(1..9).each do |turn_counter|
  player = turn_counter % 2 == 0 ? Player2 : Player1
  name = player_name(player)

  puts render_grid

  puts "TURN #{turn_counter}: #{name}"

  cell = request_choice
  set_cell(cell, player)

  break if is_draw? or winner
end

puts "\n\n-----------------------------\n\n"
puts "Draw? #{is_draw?}"
puts "Winner: #{winner}"
puts render_grid