class Player
  attr_accessor :name, :life_points 

  def initialize(name_te_save)
    @name = name_te_save
    @life_points = 10
  end

  def show_state
    if @life_points > 0
      print "#{@name} a #{@life_points} point(s) de vie. "
    else
      print "#{@name} est mort(e) ! "
    end
  end

  def gets_damage(damage)
    @life_points -= damage.to_i
    if  @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(player2)
    if @life_points > 0 && player2.life_points > 0
      damage = compute_damage.to_i
      puts "le joueur #{@name} attaque le joueur #{player2.name}."
      puts "il lui a infligé #{damage} points de dommages."
      player2.gets_damage(damage)
    end
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_te_save)
    @weapon_level = 1
    @life_points = 100
    @name = name_te_save
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}."
    else
      puts "#{@name} est mort(e) !"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}."
    if @weapon_level < new_weapon
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "Elle est moins bonne que ton arme actuelle, tu la laisse."
    end
  end

  def search_health_pack
    find_potion = rand(1..6)
    if find_potion == 1
      puts "Tu n'as rien trouvé... "
    elsif find_potion >= 2 && find_potion <= 5
      if @life_points + 50 > 100
        @life_points = 100
      else
        @life_points += 50
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif find_potion == 6
      if @life_points + 80 > 100
        @life_points = 100
      else
        @lif
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end
    end
  end

end