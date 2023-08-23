class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  validates :situation, presence: true
  validates :action, presence: true
  validates :consequence, presence: true
  before_create :change_url


  SITUATIONS = ['family', 'work', 'friends', 'relationship', 'other']

  def change_url
    self.url = url&.gsub(/watch\?v=/, 'embed/')
  end

  include PgSearch::Model
  pg_search_scope :search_by_sac,
  against: [ :situation, :action, :consequence ],
  associated_against: {
    emotion: [ :name ]
  },
  using: {
    tsearch: { prefix: true }
  }

  # include PgSearch::Model
  # multisearchable against: [:situation, :action, :consequence]

end
