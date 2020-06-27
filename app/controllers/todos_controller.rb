class TodosController < ApplicationController
  before_action :load_project
  before_action :find_todo, only: %i[update]
  before_action :build_todo, only: %i[create]

  rescue_from ActiveRecord::RecordInvalid, with: :show_errors
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def create
    @todo.save!
    render json: @todo
  end

  def update
    @todo.update!(todo_params)
    render json: @todo
  end

  private

  def load_project
    @project = Project.find_by(id: params[:project_id])
    @todos = @project&.todos || Todo.all
  end

  def build_todo
    @todo = @todos.build(todo_params)
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:text, :completed, :project_id)
  end

  def show_errors
    render json: {
        message: "Validation Failed",
        errors: @todo.errors.full_messages
    }, status: :unprocessable_entity
  end
end
