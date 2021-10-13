class Post < ApplicationRecord

  has_many :prefectures,  dependent: :destroy
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  attachment :image

  validates :image, presence: true
  validates :place_name, presence: true
  validates :address, presence: true
  validates :detail, presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def self.search(keyword)
    where(["address like? OR detail like? OR place_name like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

end
