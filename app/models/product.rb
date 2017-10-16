class Product < ApplicationRecord
  belongs_to :video
  has_many :clicks
  has_many :exact_requests
end
