module ProjectsHelper
	def user_can_edit?(project)
  	return true if project.creator_id == current_user.id
  end
end
