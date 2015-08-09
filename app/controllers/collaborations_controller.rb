class CollaborationsController < ApplicationController
  helper_method :mailbox, :conversation

  def create
    require_login
    project = Project.find_by(id: params[:project_id])
    if project && !collaboration_exists?(current_user, project)
      @pending = Collaboration.create(collaborator_id: current_user.id, project_id: project.id)
      # recipient = User.find_by(id: project.creator)
      # conversation = current_user.send_message(recipient, "#{@pending.collaborator.username} has requested to join your project: #{project.title}", 'Request').conversation

      flash[:success] = "You have requested to collaborate on '#{project.title}'"
    else
      flash[:errors] = ["You have already made a request to collaborate on this project."]
    end
    redirect_to project_path(project)
  end

  def update
    collaborations = Collaboration.find_by(id: params[:id])
    collaborations.status = params[:status]
    if collaborations.save && collaborations.status == 'approved'
      flash[:success] = "You have approved the person"
      redirect_to mailbox_inbox_path
    elsif collaborations.save && collaborations.status == 'denied'
      flash[:success] = "You have denied the person"
      redirect_to mailbox_inbox_path
    else
      flash[:errors] = collaboration.errors.full_messages
      redirect_to mailbox_inbox_path
    end
  end

  private
  def collaboration_exists? (user, project)
    Collaboration.find_by(collaborator_id: user.id, project_id: project.id)
  end
end
