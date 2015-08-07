class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User"

end
