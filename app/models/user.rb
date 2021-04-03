class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :books, dependent: :destroy
  attachment:profile_image

  # nameカラムに一意性、２〜２０文字の制限
  validates :name, uniqueness: true, {length: { in: 2..20 }}
  # introduction、文字数最大５０文字
  validates :introduction, length: { maximum: 50 }
end
