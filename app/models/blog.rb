class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 100 }
end
