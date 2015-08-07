class Collaboration < ActiveRecord::Base
  belongs_to :collaborator, class_name: "User"
  belongs_to :project

  validates :collaborator_id, presence: true
  validates :project_id, presence: true
  validates :status, presence: true
end

