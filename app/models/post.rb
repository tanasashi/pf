class Post < ApplicationRecord

  belongs_to :user
  has_many :prefectures,  dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  attachment :image

  validates :image, presence: true
  validates :area_id, presence: true
  validates :place_name, presence: true
  validates :address, presence: true
  validates :detail, presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def self.search(keyword)
    if keyword.present?
      where(["place_name like? OR detail like? OR address like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    else
      []
    end
  end

end