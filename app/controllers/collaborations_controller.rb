class CollaborationsController < ApplicationController
  helper_method :mailbox, :conversation

  def create
    require_login
    project = Project.find_by(id: params[:project_id])
    if project && !collaboration_exists?(current_user, project)
      project.collaborations << Collaboration.new(collaborator_id: current_user.id)
      message_to_be_sent = project.collaborations
      message_to_be_sent.each {|x| x.status == 'pending' ? @pending = x : next}
      recipient = User.find_by(id: project.creator)
      conversation = current_user.send_message(recipient, "#{@pending.collaborator.username} has requested to join your project", 'Request').conversation
      flash[:success] = "You have requested to collaborate on '#{project.title}'"
    else
      flash[:errors] = ["You have already made a request to collaborate on this project."]
    end
    redirect_to project_path(project)
  end

  def update
  end

  private
  def collaboration_exists? (user, project)
    Collaboration.find_by(collaborator_id: user.id, project_id: project.id)
  end
end
