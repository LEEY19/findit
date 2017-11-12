class SceneProduct < ApplicationRecord
  belongs_to :scene, touch: true
end
