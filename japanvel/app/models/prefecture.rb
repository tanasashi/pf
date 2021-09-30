class Prefecture < ApplicationRecord
  
  belongs_to :user
  
  attachment :image
end
