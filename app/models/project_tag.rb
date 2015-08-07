class ProjectTag < ActiveRecord::Base
  belongs_to :project
  belongs_to :tag

  validates :project_id, presence: true
  validates :tag_id, presence: true
end
