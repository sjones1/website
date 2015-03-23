class Fundraiser < ActiveRecord::Base

   validates :title, presence: true, length: { maximum: 120 }
   validates :content, presence: true, length: { minimum: 20 }
   validates :date, presence: true




end
