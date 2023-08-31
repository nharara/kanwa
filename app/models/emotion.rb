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
      "sad" => "#8AB2BB" #dark blue
    }



end

# before filter date
# [3167, 3174, 3181, 3191, 3205, 3211, 3218, 3225, 3246, 3259, 3267]
# after filter date
# [3167, 3191, 3205, 3211, 3218, 3267]

# entries
# [3158, 3242, 3197, 3261, 3216, 3156, 3202, 3228, 3232, 3209, 3183, 3172, 3248, 3193, 3177]
