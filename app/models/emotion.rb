class Emotion < ApplicationRecord
  belongs_to :emotion
  has_many :entries
  has_many :posts, through: :tags
end
