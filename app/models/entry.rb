class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  validates :situation, presence: true
  validates :action, presence: true
  validates :consequence, presence: true

  SITUATIONS = ['family', 'work', 'friends', 'relationship', 'other']

  include PgSearch::Model
  pg_search_scope :search_by_sac,
  against: [ :situation, :action, :consequence, :created_at ],
  associated_against: {
    emotion: [ :name ]
  },
  using: {
    tsearch: { prefix: true }
  }

  # include PgSearch::Model
  # multisearchable against: [:situation, :action, :consequence]

end
