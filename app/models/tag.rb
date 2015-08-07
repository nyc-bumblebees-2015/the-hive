class Tag < ActiveRecord::Base
  has_many :project_tags
  has_many :projects, through: :project_tags

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 1..30}
end
