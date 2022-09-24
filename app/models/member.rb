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
  validates :year_of_birth, length: { is: 4}, if: :year_guest?
  validates :email, presence: true
  validates :self_introduction, length: {maximum: 200}

  # ゲストログイン機能用（public/sessionsコントローラで使用）
  def self.guest
    find_or_create_by!(name: 'guestmember' ,email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name_kana = "guestmember"
      member.nickname = "ゲスト会員"
    end
  end

  def year_guest?
    self.email != 'guest@example.com'
  end

end