class Book < ApplicationRecord


   belongs_to :user
   validates :title, presence: true
   validates :body, presence: true, length: { maximum: 200 }
   # validates :opinion, presence: true



end
