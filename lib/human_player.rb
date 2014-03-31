class HumanPlayer
  def assign_damage(choices)
    puts "Assign damage:"
    choose_from_list(choices)
  end
  
  def choose_from_list(choices)
    choices.each_with_index do |choice, i|
      puts "#{i}. #{choice}"
    end
    puts "(Enter a number)"
    gets.to_i
  end
  
  def assign_to_battle_line?(ship)
    print ship
    print "\n"
    puts "Assign to line of battle? (Y/n)"
    gets.comp.downcase == "y"
  end
  
  def choose_range
    puts "Choose range:"
    puts "0. Short"
    puts "1. Long"
    puts "(Enter a number)"
    gets.to_i == 0 ? :short : :long
  end
  
  def select_repair(choices)
    puts "Choose system to repair:"
    choose_from_list(choices)
  end
end