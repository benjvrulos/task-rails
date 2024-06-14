class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :correct_user,only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @project = Project.find(params[:project_id])

  end

  # GET /tasks/new
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new

  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: "Tarea exitosamente creada" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project , notice: "Tarea exitosamente editada." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to @project, notice: "Tarea exitosamente eliminada" }
      format.json { head :no_content }
    end
  end


  def correct_user
    @project = current_user.projects.find_by(id:params[:project_id])
    redirect_to projects_path, alert:"Permiso denegado" if @project.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :completed, :project_id)
    end
end
