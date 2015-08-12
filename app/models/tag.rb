class Tag < ActiveRecord::Base
  has_many :project_tags
  has_many :projects, through: :project_tags

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 1..30 }

  def self.most_popular
      select("tags.id, tags.name, count(projects.id) AS projects_count").
      joins(:projects).
      group("tags.id").
      order("projects_count DESC")
  end

  def self.all_tags 
    Tag.all.pluck(:name).to_a
  end
end
