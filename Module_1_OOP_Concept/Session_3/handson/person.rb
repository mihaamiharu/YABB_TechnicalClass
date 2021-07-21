class Person
    attr_reader :name, :hitpoint, :attack_damage

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @alive = true
    end

    def to_s
        "#{@name}"
    end

    def print_stats
        puts "#{@name} has #{@hitpoint} and #{@attack_damage} attack damage"
    end

    def attack(other_person)
        puts "#{@name} attacks #{@other_person.name} with #{@attack_damage} attack damage"
        other.person.take_damage(@attack_damage)
    end

    def take_damage(damage)
        @hitpoint -= damage
		if @hitpoint <= 0 
			die
		end
    end

    # def minus_hp
    #     if @hitpoint < 0 
	# 		@hitpoint = 0
	# 	end
	# end

    def take_heal(heal_amount)
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


