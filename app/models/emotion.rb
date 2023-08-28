class Emotion < ApplicationRecord
  belongs_to :parent_emotion, optional: true, class_name: 'Emotion', foreign_key: :emotion_id
  has_many :child_emotions, class_name: 'Emotion', foreign_key: :emotion_id, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :child_entries, through: :child_emotions, source: :entries
  has_many :posts, dependent: :destroy
end
