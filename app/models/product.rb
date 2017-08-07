class Product < ApplicationRecord
  belongs_to :video
  has_many :clicks
end
