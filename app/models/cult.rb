class Cult
    attr_reader :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize name, location, founding_year, slogan, minimum_age
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age

        @@all << self
    end

    def self.all
        @@all
    end

    def members
        BloodOaths.all.filter { |el| el.cult == self }
    end

    def cult_population
        members.length
    end

    def recruit_follower follower
        follower.age >= self.minimum_age ? BloodOaths.new("", self, follower) : "You are too you to join the #{self.name}"
    end 

    def self.find_by_name name
        all.filter { |el| el.name == name }
    end

    def self.find_by_founding_year founding_year
        all.filter { |el| el.founding_year == founding_year }
    end

    def self.find_by_location location
        all.filter { |el| el.location == location }
    end

    def average_age
        members.map { |el| el.follower.age }.sum / members.length.to_f
    end

    def my_followers_mottos
        members.map { |el| el.follower.life_motto }
    end

    def self.least_popular
        all.min_by {|el| el.cult_population}
    end

    def self.most_common_location
        all.group_by { |el| el.location }.max_by{|k, v| v.length }[0]
    end
end