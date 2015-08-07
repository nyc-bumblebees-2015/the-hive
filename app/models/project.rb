class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User"

  validates :creator_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :skills_desired, presence: true

end
