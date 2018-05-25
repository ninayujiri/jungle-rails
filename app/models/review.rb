class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product, :user, :description, :presence: true
  validates :rating, length { in 1..5 }, numericality: { only_integer: true }

end
