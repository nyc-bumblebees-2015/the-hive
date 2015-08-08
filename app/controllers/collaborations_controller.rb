class CollaborationsController < ApplicationController
  def create
    require_login
    project = Project.find_by(id: params[:project_id])
    if project 
      project.collaborations << Collaboration.new(collaborator_id: current_user.id)
      flash[:success] = "You have requested to collaborate on #{project.title}"
      redirect_to project_path(project)
    end
  end

  def update
  end
end
