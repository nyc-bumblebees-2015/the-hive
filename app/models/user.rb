class User < ActiveRecord::Base
  has_secure_password
  geocoded_by :zip_code
  before_validation :geocode

  has_many :projects_created, class_name: "Project", foreign_key: "creator_id"
  has_many :collaborations, foreign_key: "collaborator_id"
  has_many :projects_collaborated_on, through: :collaborations, source: :project
end
