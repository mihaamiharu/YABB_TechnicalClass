require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @block_chance = 0.8
        @heal_amount = 20
        @spell_points = 100
    end

    def print_stats
        puts "#{@name} has #{@hitpoint} HP #{@spell_points} SP and #{@attack_damage} attack damage"
    end

    def take_damage(damage)
        if rand < @block_chance
            deflect
        else
            super(damage)
        end
    end

    def deflect
        puts "#{@name} has deflects the attack"
    end

    def heal(other_hero)
        if @spell_points >= 10
        other_hero.take_heal(@heal_amount)
        sp_consumption
        end
    end

    def sp_consumption
        @spell_points -= 10
    end

end



