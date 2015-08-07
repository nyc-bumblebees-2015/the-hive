class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User"

  validates :creator, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :skills_desired, presence: true

  # def valid_tags?(tags)
  #   tags.all? { |tag| TECH_TAGS.include?(tag)}
  # end

end

