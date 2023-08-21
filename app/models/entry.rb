class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :emotion
  validates :situation, presence: true
  validates :action, presence: true
  validates :consequence, presence: true
end
