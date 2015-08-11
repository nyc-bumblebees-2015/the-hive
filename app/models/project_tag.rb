class ProjectTag < ActiveRecord::Base
  belongs_to :project
  belongs_to :tag

  validates :project, presence: true
  validates :tag, presence: true
end
