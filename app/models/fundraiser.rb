class Fundraiser < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :date, presence: true
end
