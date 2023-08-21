class Entry < ApplicationRecord
  belongs_to :user
  validates :situation, presence: true
  validates :action, presence: true
  validates :consequence
end
