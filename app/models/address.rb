class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :order
  belongs_to :prefecture

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, format: {with: /\d{1,11}/, message: "is invalid. Please enter in 11-letter numbers."}
    validates :city
    validates :address_line1
    validates :phone_number
  end
end
