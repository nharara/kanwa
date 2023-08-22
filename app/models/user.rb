class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :entries, dependent: :destroy

  #validates :nickname, uniqueness: true
  #validates :full_name, presence: true
end
