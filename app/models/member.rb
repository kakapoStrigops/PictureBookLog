class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum delete_status: { active: false, withdrawal: true }

  has_many :candidate_posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :nickname, presence: true
  validates :year_of_birth, presence: true, length: { is: 4}
  validates :email, presence: true
  validates :self_introduction, length: {maximum: 200}

end
