class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :prefecture, :city, :address_line1, :address_line2, :phone_number, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, format: { with: /\d{1,11}/, message: 'is invalid. Please enter in 11-letter numbers.' }
    validates :city
    validates :address_line1
    validates :phone_number
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture, city: city, address_line1: address_line1, address_line2: address_line2,
                   phone_number: phone_number, order_id: order.id)
  end
end
