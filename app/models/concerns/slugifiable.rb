
module Slugifiable
    module InstanceMethods
        def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end
    module ClassMethods
        def self.find_by_slug(slug_param)
            self.all.find do |i|
                i.slug == slug_param
            end
        end
    end
end