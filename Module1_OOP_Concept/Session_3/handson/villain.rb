require_relative 'person'

class Villain < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @flee_chance = 0.5
        @fled = false
    end

    def take_damage(damage)
        super()
        if @hitpoint <=50 && !die
            flee if rand < @flee_chance
        end
    end

    def flee
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoints left"
        @fled = true
    end

    def flee?
        @fled
    end

    def removed?
        die? || flee?
    end

end