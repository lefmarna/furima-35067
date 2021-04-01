class Order < ApplicationRecord
  has_one :address, dependent: :destroy

  belongs_to :user
  belongs_to :item
end
