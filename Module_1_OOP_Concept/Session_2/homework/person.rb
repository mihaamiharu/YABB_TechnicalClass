class Person
	attr_reader :name, :hitpoint, :attack_damage
	
	def initialize(name, hitpoint, attack_damage)
		@name = name
		@hitpoint = hitpoint
		@attack_damage = attack_damage
	end
	
	def to_s
	"#{@name}"
	end

	def print_stats
		puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
	end
	
	def attack(other_player)
		puts "#{@name} attacks #{other_player.name} with #{@attack_damage} attack damage"
		other_player.take_damage(@attack_damage)
	end
	
	def take_damage(damage)
		if @hitpoint <= 0 
			die
		else
			@hitpoint -= damage
		end
	end

	def take_healing(heal_amount)
		@hitpoint += heal_amount
	end
	
	def die
		puts "#{@name} has died"
		@alive = false
	end

	def die?
		!@alive
	end

	def removed?
		die?
	end
	
end