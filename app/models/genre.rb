class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artist_genres
    has_many :artists, through: :artist_genres

    # def slug
    #     self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    # end

    def self.find_by_slug(slug_param)
        self.all.find do |i|
            i.slug == slug_param
        end
    end

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods



end