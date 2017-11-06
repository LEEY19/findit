class Scene < ApplicationRecord
  belongs_to :episode
  has_many :scene_products
end
