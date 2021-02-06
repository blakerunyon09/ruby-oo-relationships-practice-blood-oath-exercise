class Followers
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age num 
        all.filter {|el| el.age === num }
    end

    def cults
        BloodOaths.all.filter{ |el| el.follower == self }
    end

    def join_cult cult
        age >= Cult.all.find {|el| el.name == cult.name }.minimum_age ? BloodOaths.new("", cult, self) : "You're to young to join the #{cult.name}"
    end

    def my_cults_slogans
        cults.map{ |el| el.cult.slogan }
    end

    def self.most_active
        BloodOaths.all.group_by { |el| el.follower }.max_by{ |k, v| v.length }[0].name
    end

    def self.top_ten
        all.sort_by { |el| -el.cults.length }
    end

    def fellow_cult_members
        a = cults.map { |t| t.cult.name }
        BloodOaths.all.filter { |el|
            a.include?(el.cult.name)
        }.map{ |el| el.follower.name }
    end

end