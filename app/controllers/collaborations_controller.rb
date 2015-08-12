class CollaborationsController < ApplicationController

  def create
    require_login
    project = Project.find_by(id: params[:project_id])
    if project && !collaboration_exists?(current_user, project)
      @pending = Collaboration.create(collaborator_id: current_user.id, project_id: project.id)
      flash[:notice] = "You have requested to collaborate on '#{project.title}'"
    else
      flash[:errors] = ["You have already made a request to collaborate on this project."]
    end
    redirect_to project_path(project)
  end

  def update
    collaborations = Collaboration.find_by(id: params[:id])
    collaborations.status = params[:status]
    if collaborations.save && collaborations.status == 'approved'
      flash[:notice] = "You have approved the person"
    elsif collaborations.save && collaborations.status == 'denied'
      flash[:notice] = "You have denied the person"
    else
      flash[:errors] = collaboration.errors.full_messages
    end
    redirect_to mailbox_inbox_path
  end

  private
  def collaboration_exists? (user, project)
    Collaboration.find_by(collaborator_id: user.id, project_id: project.id)
  end
end
