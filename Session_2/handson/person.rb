class Person
	attr_reader :name
	
	def initialize(name, hitpoint, attack_damage)
		@name = name
		@hitpoint = hitpoint
		@attack_damage = attack_damage
	end
	
	def to_s
	"#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
	end
	
	def attack(other_player)
		puts "#{@name} attacks #{other_player.name} with #{@attack_damage} attack damage"
		other_player.take_damage(@attack_damage)
	end
	
	def take_damage(damage)
		@hitpoint -= damage
	end
	
	def die?
		if @hitpoint <= 0
		puts "#{@name} has died"
		return true
		end
	end
	
end