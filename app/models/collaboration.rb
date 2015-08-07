class Collaboration < ActiveRecord::Base
  belongs_to :collaborator, class_name: "User"
  belongs_to :project
end

