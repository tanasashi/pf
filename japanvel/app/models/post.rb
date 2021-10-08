class Post < ApplicationRecord

  has_many :prefectures,  dependent: :destroy
  belongs_to :user
  attachment :image
  
  has_many :bookmarks, dependent: :destroy
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
