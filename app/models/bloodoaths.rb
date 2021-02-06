class BloodOaths
    attr_reader :follower, :cult, :join_date

    @@all = []

    def initialize join_date, cult, follower
        @join_date = join_date
        @follower = follower
        @cult = cult

        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        all.min_by { |el| el.join_date.tr("_-", "").to_i }.follower.name
    end

end