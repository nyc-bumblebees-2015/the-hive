class Collaboration < ActiveRecord::Base

  belongs_to :collaborator, class_name: "User"
  belongs_to :project

  validates :collaborator, presence: true
  validates :project, presence: true
  validates :status, presence: true

  def approve
    update(status: 'approved')
  end

  def deny
    update(status: 'denied')
  end

end

