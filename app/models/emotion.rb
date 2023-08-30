class Emotion < ApplicationRecord
  belongs_to :parent_emotion, optional: true, class_name: 'Emotion', foreign_key: :emotion_id
  has_many :child_emotions, class_name: 'Emotion', foreign_key: :emotion_id, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :child_entries, through: :child_emotions, source: :entries
  has_many :posts, dependent: :destroy

  EMOTIONS = ["angry", "disgusted", "fearful", "bad", "surprised", "happy", "sad"]

    EMOTION_COLOR = {
      "angry" => "#EAB9B9", #light red
      "disgusted" => "#F07167", #dark red
      "fearful" => "#a5cca9", #green
      "bad" => "#b9b9ea", #gray?
      "surprised" => "#ffcb77", #yellow
      "happy" => "#b9eaea", #light blue
      "sad" => "8AB2BB" #dark blue
    }


end
