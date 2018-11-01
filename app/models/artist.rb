require_relative './concerns/slugifiable.rb'
class Artist < ActiveRecord::Base
    has_many :songs
    has_many :artist_genres
    has_many :genres, through: :artist_genres

    # def slug
    #     self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    # end

    def self.find_by_slug(slug_param)
        self.all.find do |i|
            i.slug == slug_param
        end
    end

    
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end