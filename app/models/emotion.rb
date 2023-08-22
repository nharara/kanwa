class Emotion < ApplicationRecord
  belongs_to :parent_emotion, optional: true, class_name: 'Emotion', foreign_key: :emotion_id, dependent: :destroy
  has_many :entries
  has_many :posts, through: :tags
end
