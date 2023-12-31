class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         validates :birth, presence: true
         validates :last_name_full, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :first_name_full, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } 
         validates :last_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ } 

  has_many :items
  has_many :orders
end
