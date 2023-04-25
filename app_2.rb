require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def print_intro
  puts "▇" * 91
  puts "▇" * 37 + "  welcome to  " + "▇" * 40
  puts "▇" * 91
  puts'▇▇▇  ____  _____ _____ _____      _____ _____ _____      _____ _____ _____ __    _____  ▇▇▇
▇▇▇ |    \|  _  | __  |  |  |    |_   _|  |  |  _  |    |   __|     |  |  |  |  |   __| ▇▇▇
▇▇▇ |  |  |     |    -|    -|      | | |     |   __|    |__   |  |  |  |  |  |__|__   | ▇▇▇
▇▇▇ |____/|__|__|__|__|__|__|      |_| |__|__|__|       |_____|_____|_____|_____|_____| ▇▇▇'
  # puts "▇▇▇" + " " * 85 + "▇▇▇"
  puts "▇" * 91
  # puts "▇▇▇" + " " * 85 + "▇▇▇"
end

def print_end
  puts "▇" * 33 + "  Merci d'avoir joué !  " + "▇" * 34
  puts "▇" * 91
end

def create_your_character
  print "Choisis un nom pour ton personnage : "
  name = gets.chomp
  human = HumanPlayer.new(name)
  puts "Le personnage #{name} est apparu !\n\n"
  return human
end

def save_enemies(list, enemie)
  list << enemie
end

def create_enemies
  list = []
  # enemie = gets.chomp
  # list = save_enemies(list, enemie)
  bot1 = Player.new("mort-vivant")
  puts "un #{bot1.name} est apparu !"
  bot2 = Player.new("squelette")
  puts "un #{bot2.name} est apparu !"
  list = save_enemies(list, bot1)
  list = save_enemies(list, bot2)
  return list
end

def print_state(human, enemies)
  puts "C'est à ton tour, que veux-tu faire ?"
  print "a - chercher une meilleure arme | s - chercher à se soigner | 0 - "
  print enemies[0].show_state
  print " | 1 - "
  print enemies[1].show_state
  print "\nton choix : "
end

def human_turn(human, enemies)
  puts "\n --- Nouveau tour --- "
  print_state(human, enemies)
  action = gets.chomp
  while action != "a" && action != "s" && action != "0" && action != "1"
    puts "Action impossible."
    print_state(human, enemies)
    action = gets.chomp
  end
  if action == "a"
    human.search_weapon
  elsif action == "s"
    human.search_health_pack
  elsif action == "0"
    human.attacks(enemies[0])
    enemies[0].show_state
  else
    human.attacks(enemies[1])
    enemies[1].show_state
  end
end

def fight(human, enemies)
  while human.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0 )
    print human.show_state
    human_turn(human, enemies)
    puts "\nLes ennemies t'attaquent !"
    if enemies.each{|mob|
      mob.attacks(human)
    }
    end
  end
  if human.life_points > 0
    puts "\nBRAVO ! TU AS GAGNÉ !"
  else
    puts "\nLoser ! Tu as perdu !"
  end
end

def main
  print_intro

  human = create_your_character
  enemies = create_enemies
  fight(human, enemies)

  print_end
end

main