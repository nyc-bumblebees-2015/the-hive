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

  def tags_for_edit
    tags.map { |tag| tag.name }.join(', ')
  end

  def collaborators_with_status(status)
    User.joins(:collaborations)
    .select("collaborations.project_id, collaborations.status, users.*")
    .where("status='#{status}' AND project_id=#{self.id}")
  end

end

