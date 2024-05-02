class Category < ApplicationRecord
  has_one_attached :image do |attachble|
    attachble.variant :thumb, resize_to_limit: [50, 50]
  end
end
