require_relative 'person'

class Hero  < Person

    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @block_chance = 0.8

    end

    def take_damage(damage)
        if rand < @block_chance
            puts "#{@name} deflects the attack."
        else 
            @hitpoint -= damage
        end
    end


    
end
