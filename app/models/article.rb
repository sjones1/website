class Article < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {minimum: 20}, uniqueness: {case_sensitive: false}

end
