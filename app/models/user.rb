class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_records

  with_options presence: true do
  
    validates :nickname

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: '半角英数を両方含む必要があります'

    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }

    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday
  end
end
