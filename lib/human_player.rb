require './lib/player'

class HumanPlayer < Player
  
  def assign_batteries(fleet, ship)
    # Returns an array
    raise "Not implemented"
  end
  
  def assign_damage(choices)
    puts "Assign damage:"
    choose_from_list(choices)
  end
  
  def assign_defenses(ship, hits)
    # Returns a 2d array, with length equal to hits
    raise "Not implemented"
  end
  
  def assign_to_battle_line?(ship)
    print ship
    print "\n"
    puts "Assign to line of battle? (Y/n)"
    gets.comp.downcase == "y"
  end
  
  def begin_combat_step
    puts "Beginning combat step"
  end

  def choose_from_list(choices)
    choices.each_with_index do |choice, i|
      puts "#{i}. #{choice}"
    end
    puts "(Enter a number)"
    gets.to_i
  end
    
  def choose_range
    puts "Choose range:"
    puts "0. Short"
    puts "1. Long"
    puts "(Enter a number)"
    gets.to_i == 0 ? :short : :long
  end
  
  def see_range(range)
    puts "Other player chooses to begin at #{range} range."
  end
  
  def select_repair(choices)
    puts "Choose system to repair:"
    choose_from_list(choices)
  end
end