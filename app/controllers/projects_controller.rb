class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :select, :deselect]
  before_action :authenticate_user!  

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.joins(:project_criterium).select('projects.name, projects.description, projects.id, projects.confirmed, sum(weight) as total').group('projects.name, projects.description, projects.id').order('total DESC')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Se creó el proyecto éxito.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Se actualizó el proyecto con éxito.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Se borró el proyecto con éxito.' }
      format.json { head :no_content }
    end
  end

  def select
    @project.update_attribute(:confirmed, true)
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Se seleccionó el proyecto con éxito.' }
      format.json { head :no_content }
    end
  end

  def deselect
    @project.update_attribute(:confirmed, false)
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Se deseleccionó el proyecto con éxito.' }
      format.json { head :no_content }
    end
  end

  def selected
    @projects = Project.joins(:project_criterium).select('projects.name, projects.description, projects.id, projects.confirmed, sum(weight) as total').where(confirmed: true).group('projects.name, projects.description, projects.id').order('total DESC')    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, project_criterium_attributes: [:name, :value, :weight])
    end
end
