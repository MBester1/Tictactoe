P1 = "Player 1"
P2 = "Player 2"

grid = {
  "a1" => nil, "b1" => nil, "c1" => nil,
  "a2" => nil, "b2" => nil, "c2" => nil,
  "a3" => nil, "b3" => nil, "c3" => nil
}

def valid_choice?(choice, grid)
  grid.keys.include?(choice) and grid[choice] == nil
end

def winner?(grid)
  #ROWS ACROSS:
  if grid["a1"] != nil and grid["a1"] == grid["b1"] and grid["a1"] == grid["c1"]
    return grid["a1"]
  elsif grid["a2"] != nil and grid["a2"] == grid["b2"] and grid["a2"] == grid["c2"]
    return grid["a2"]
  elsif grid["a3"] != nil and grid["a3"] == grid["b3"] and grid["a3"] == grid["c3"]
    return grid["a3"]
  #COLUMNS:
elsif grid["a1"] != nil and grid["a1"] == grid["a2"] and grid["a1"] == grid["a3"]
    return grid["a1"]
  elsif grid["b1"] != nil and grid["b1"] == grid["b2"] and grid["b1"] == grid["b3"]
    return grid["b1"]
  elsif grid["c1"] != nil and grid["c1"] == grid["c2"] and grid["c1"] == grid["c3"]
    return grid["c1"]
  #DIAGONALS:
elsif grid["a1"] != nil and grid["a1"] == grid["b2"] and grid["a1"] == grid["c3"]
    return grid["a1"]
  elsif grid["a3"] != nil and grid["a3"] == grid["b2"] and grid["a3"] == grid["c1"]
    return grid["a3"]
  end
end

def display_cell(value)
  if value == P1
    return "X"
  elsif value == P2
    return "O"
  else
    return "-"
  end
end

def display_grid(grid)
  #puts "  1  2  3\na|#{grid["a1"]}|#{grid["a2"]}|#{grid["a3"]}|\nb|#{grid["b1"]}|#{grid["b2"]}|#{grid["b3"]}|\nc|#{grid["c1"]}|#{grid["c2"]}|#{grid["c3"]}|"
  puts "   1 2 3\n" \
  "a |#{display_cell(grid["a1"])}|#{display_cell(grid["a2"])}|#{display_cell(grid["a3"])}|\n" \
  "b |#{display_cell(grid["b1"])}|#{display_cell(grid["b2"])}|#{display_cell(grid["b3"])}|\n" \
  "c |#{display_cell(grid["c1"])}|#{display_cell(grid["c2"])}|#{display_cell(grid["c3"])}|"
end

#1st Turn:
system ("clear")
turn_counter = 0
display_grid(grid)
puts "Player 1, please select a block"
choice = gets.chomp.downcase

#8xrepeat:
  while turn_counter <=7
    while !valid_choice?(choice, grid)
      system ("clear")
      display_grid(grid)
      puts "Sorry, invalid choice, please choose another block."
      choice = gets.chomp.downcase
    end

    if turn_counter % 2 == 0
      grid[choice] = P1
      next_player = P2
    else
      grid[choice] = P2
      next_player = P1
    end
    system ("clear")
    display_grid(grid)

    if winner?(grid) != nil
       puts "#{winner?(grid)} wins!"
       exit()
    end

    puts "#{next_player} please select a block"
    choice = gets.chomp.downcase
    turn_counter += 1
    system("clear")
end

# On 9th turn:
grid[choice] = P1
display_grid(grid)
if winner?(grid) != nil
   puts "#{winner?(grid)} wins!"
   exit()
 elsif winner?(grid) == nil
  puts "Game over, no winner... :("
end
