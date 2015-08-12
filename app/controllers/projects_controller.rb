class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :check_privileges, only: [:edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    tags = params[:tags].split(',')
    tags.each do |tag|
      valid_tag = Tag.find_by(name: tag.strip.capitalize)
      if valid_tag
        @project.tags << valid_tag
      else
        flash.now[:errors] = ["The tag #{tag.strip} does not exist"]
      end
    end
    if flash.now[:errors].nil? && @project.save
      redirect_to @project
    else
      flash.now[:errors] = @project.errors.full_messages
      render :new
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
    if @project.nil?
      redirect_to :root, notice: "Project doesn't exist."
    else
      @active_collaborators = @project.collaborators_with_status("approved")
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:id])
    current_tags = @project.project_tags
    current_tags.destroy_all
    @project.assign_attributes(project_params)
    tags = params[:tags].split(',')
    if @project.save
      tags.each do |tag|
        valid_tag = Tag.find_by(name: tag.strip.capitalize)
        if valid_tag
          @project.tags << valid_tag
        else
          flash[:notice] = "That tag does not exist"
        end
      end
      redirect_to @project, notice: "Project updated successfully"
    else
      flash.now[:errors] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    Project.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  def results
    if params[:search].present?
      @users = User.near(params[:search], params[:distance].to_i, :order => 'distance').where.not(:id => current_user.id)
    end
    @projects = []
    @users.each do |user|
      user.projects_created.each do |project|
        @projects << project
      end
    end
    if request.xhr?
      render partial: 'projects/project', collection: @projects
    end

  end

private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :status, :level, :skills_desired, :repo_link).merge(creator_id: session[:user_id])
  end

  def check_privileges
    unless current_user.id == Project.find_by(id: params[:id]).creator_id
     redirect_to root_path, notice: "not authorized!"
    end
  end

end
