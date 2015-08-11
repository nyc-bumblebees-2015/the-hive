class Collaboration < ActiveRecord::Base

  belongs_to :collaborator, class_name: "User"
  belongs_to :project

  validates :collaborator, presence: true
  validates :project, presence: true
  validates :status, presence: true

end

