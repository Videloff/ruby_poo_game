class Player
  attr_accessor :name, :life_points 

  def initialize(name_te_save)
    @name = name_te_save
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie"
  end

  def gets_damage(damage)
    @life_points -= damage.to_i
    if  @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(player2)
    puts "le joueur #{player2.name} attaque le joueur #{@name}"
    damage = compute_damage.to_i
    gets_damage(damage)
    puts "il lui infligé #{damage} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end

end