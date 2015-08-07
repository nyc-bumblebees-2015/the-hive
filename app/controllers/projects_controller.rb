class ProjectsController < ApplicationController
  before_action: require_login, only [:create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user
    if @project.save
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      render :new
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to root_path
  end

private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :status, :skills_desired, :repo_link).merge(user_id: session[:user_id])
  end

end
