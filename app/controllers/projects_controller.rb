class ProjectsController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update, :destroy]

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
        flash[:errors] = @project.errors.full_messages
      end
    end
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to root_path
  end

private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :status, :skills_desired, :repo_link).merge(creator_id: session[:user_id])
  end

end
