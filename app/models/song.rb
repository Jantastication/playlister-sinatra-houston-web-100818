class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

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