class Article < ApplicationRecord
    has_many :photos

    after_create :save_photos
    after_update :save_photos

    def photos=(value)
        @photos = value
    end

    private

    def save_photos
        @photos.each do |photo_image|
            Photo.create(article_id: self.id, image: photo_image)
        end
    end
end
