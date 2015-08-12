class User < ActiveRecord::Base
  has_secure_password
  acts_as_messageable

  geocoded_by :zip_code
  after_validation :geocode
  before_validation :location

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


  def gravatar_url(size = 200)
    default_url = "http://i60.tinypic.com/27yoagy.png"
    gravatar_id = Digest::MD5::hexdigest(self.email.downcase)
    "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size.to_s}"
  end

  def mailboxer_name
    self.username
  end

  def mailboxer_email(object)
    nil
  end

  def pending_requests_for_projects
    Collaboration.joins(:project)
    .select("projects.creator_id, collaborations.*")
    .where("collaborations.status='pending' AND projects.creator_id=#{self.id}")
  end

  def approved_collaborations
    Project.joins(:collaborations)
    .select("collaborations.status, collaborations.collaborator_id, projects.*")
    .where("collaborations.status='approved' AND collaborator_id=#{self.id}")
  end

  def location
    result = Geocoder.search(self.zip_code)
    self.state = result.first.try(:province)
    self.city = result.first.try(:city)
  end
