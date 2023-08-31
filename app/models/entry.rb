class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  validates :situation, presence: true
  validates :action, presence: true
  validates :consequence, presence: true

  SITUATIONS = ['family', 'work', 'friends', 'relationship', 'other']

  SITUATION_PIC = {
    "family" => "fa-solid fa-people-roof",
    "work" => "fa-solid fa-briefcase",
    "friends" => "fa-solid fa-user-group",
    "relationship" => "fa-regular fa-heart",
    "other" => "fa-regular fa-circle-question"
  }

  include PgSearch::Model
  pg_search_scope :search_by_sac,
                  against: %i[situation action consequence created_at],
                  associated_against: { emotion: [:name] },
                  using: { tsearch: { prefix: true } }

  # include PgSearch::Model
  # multisearchable against: [:situation, :action, :consequence]
end
