class Post < ApplicationRecord

  has_many :prefectures,  dependent: :destroy
  belongs_to :user
  attachment :image

end
