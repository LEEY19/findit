class Product < ApplicationRecord
  belongs_to :video
  has_many :clicks
  has_many :exact_requests

  def appeared_at_in_sec
    t = appeared_at.split(":").map(&:to_i)
    t[0] * 60 + t[1]
  end
end
