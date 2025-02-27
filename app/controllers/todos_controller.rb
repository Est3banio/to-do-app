class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy toggle ]

  # GET /todos or /todos.json
  def index
    @categories = Category.all
    @todo = Todo.new
    
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @todos = @category.todos.by_user(current_user).includes(:categories)
    else
      @todos = current_user.todos.includes(:categories)
    end
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    @categories = Category.all
  end

  # GET /todos/1/edit
  def edit
    @categories = Category.all
  end

  # POST /todos or /todos.json
  def create
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        @categories = Category.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other, notice: "Task was successfully deleted." }
      format.json { head :no_content }
    end
  end
  
  # PATCH /todos/1/toggle
  def toggle
    @todo.update(completed: !@todo.completed)
    
    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo status updated." }
      format.json { render :show, status: :ok, location: @todo }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = current_user.todos.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to todos_path, alert: "You don't have access to that task."
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :completed, category_ids: [])
    end
end
