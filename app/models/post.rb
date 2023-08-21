class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :emotions, through: :tags

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 5, maximum: 200 }
end
