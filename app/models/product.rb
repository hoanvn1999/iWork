class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :invoices

  has_one_attached :product_image
end
