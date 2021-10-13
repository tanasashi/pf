class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 退会処理したアカウントをログインできない様にする。
   def active_for_authentication?
    super && (is_active == true)
   end

  validates :email, presence: true
  validates :name, presence: true

   has_many :posts, dependent: :destroy
   has_many :bookmarks, dependent: :destroy


end
