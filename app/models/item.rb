class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :shipping_charge_id, numericality: { other_than: 0 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :shipping_date_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end
