class Book < ApplicationRecord

   has_one_attached :profile_image
   belongs_to :user
   validates :title, presence: true
   validates :opinion, presence: true
   validates :body, presence: true


end
