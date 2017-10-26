class ExactRequest < ApplicationRecord
  belongs_to :view
  belongs_to :product
  validates_uniqueness_of :email, scope: [:view_id, :product_id]
end
