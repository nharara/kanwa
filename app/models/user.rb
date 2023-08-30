class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :emotions, through: :entries

  def child_entries
    Entry.where(user: self, emotion: Emotion.where.not(parent_emotion: nil))
  end

  #validates :nickname, uniqueness: true
  #validates :full_name, presence: true
end
