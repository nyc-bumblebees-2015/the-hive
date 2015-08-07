class User < ActiveRecord::Base
  has_secure_password
  geocoded_by :zip_code
  before_validation :geocode

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }, on: :create
  validates :zip_code, length: { is: 5 }
  validates_format_of :zip_code, :with => /\d/

  has_many :projects_created, class_name: "Project", foreign_key: "creator_id"
  has_many :collaborations, foreign_key: "collaborator_id"
  has_many :projects_collaborated_on, through: :collaborations, source: :project


  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(self.email.downcase)
    "http://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
