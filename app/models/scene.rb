class Scene < ApplicationRecord
  belongs_to :episode, touch: true
  has_many :scene_products
end
