class Video < ApplicationRecord
  has_many :products
  has_many :views
end
