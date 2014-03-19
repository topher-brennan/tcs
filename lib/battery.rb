require './ship'

class Battery
  attr_accessor :ship, :factor
  
  CRIT_TABLE = {
    2 => "Ship Vaporized",
    3 => "Bridge Destroyed",
    4 => "Computer Destroyed",
    5 => "Maneuver Drive Destroyed",
    6 => "One Screen Disabled",
    7 => "Jump Drive Disabled",
    8 => "Hangar/Boat Deck Destoyed",
    9 => "Power Plant Disabled",
    10 => "Crew-1",
    11 => "Spinal Mount/Fire Control Out",
    12 => "Frozen Watch/Ship's Troops Dead"
  }
  
  INTERIOR_EXP_TABLE = {
    2 => [:critical],
    3 => [:interior_explosion],
    4 => [:interior_explosion],
    5 => [:interior_explosion],
    6 => [:maneuver, 2],
    7 => [:fuel, 2],
    8 => [:weapon, 3],
    9 => [:maneuver, 1],
    10 => [:fuel, 2],
    11 => [:weapon, 2],
    12 => [:maneuver, 1],
    13 => [:fuel, 1],
    14 => [:weapon, 1],
    15 => [:weapon, 1],
    16 => [:fuel, 1],
    17 => [:weapon, 1],
    18 => [:weapon, 1],
    19 => [:fuel, 1],
    20 => [:weapon, 1],
    21 => [:weapon, 1]
  }
  
  RADIATION_TABLE = {
    
  }
  
  SURFACE_EXP_TABLE = {
    
  }
  
  def initialize(ship, factor)
    @ship = ship
    @ship.batteries << this
    @factor = factor
  end
  
  def defenses_penetrated?(target)
    raise "Not implemented"
  end
  
  def fire(target)
    if roll > to_hit(target) && defenses_penetrated?
      # proceed to the damage tables
    end
  end

  def roll(n=2)
    sum = 0
    n.times { sum += rand(6) + 1 }
    sum
  end
  
  def size_modifiers(target)
    size = target.size
    if size.class == Fixnum
      return -2 if size == 0
      return -1
    else
      return -1 if size == "A"
      return 0 if ("B".."K").include?(size)
      return 1 if ("L".."P").include?(size)
      return 2
    end
  end    

  def standard_dms_to_hit(target)
    total = @ship.comp 
    total -= target.agility
    total += size_modifiers(target)
  end

  def to_hit
    raise "Not implemented"
  end  
end

class MissileAttack < Battery
end

class BeamWeapon < Battery
end

class MesonGun < Battery
end

class ParticleAccelerator < Battery
  def attack_table
    if factor.is_a? Fixnum
      if factor < 3
        return 10 - factor
      else
        return 9 - (factor + 1)/2
      end
    else
      if ("A".."E").include?(factor)
        return 3
      elsif ("F".."K").include?(factor)
        return 2
      elsif ("L".."Q").include?(factor)
        return 1
      else
        return 0
      end
    end
  end
  
  def defenses_penetrated?(target)
    true
    # No defenses are possible against a particle accelerator
  end
  
  def roll_damage
  
  end
  
  def spinal?
    factor.is_a? String
  end
  
  def to_hit(target)
    attack_table + standard_dms_to_hit
  end
end