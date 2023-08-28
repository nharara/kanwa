class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :emotion
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 5, maximum: 200 }

  def upvote
    update(votes: votes + 1)
  end
end
