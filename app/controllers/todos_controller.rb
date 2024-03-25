class TodosController < ApplicationController
  before_action :check_user
  def index
    puts params
    @todos = if params[:search].present?
      Todo.where('title LIKE ?', "%#{params[:search]}%")
    else
      Todo.where(user_id: Current.user.id).order(priority: :desc)
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = Current.user.id
    @todo.status = Todo.statuses[:not_started]
    if @todo.save
      redirect_to todos_path(view: 'all')
    else
      render :index
    end
  end

  def new
    @todo = Todo.new
  end

  def update
    @todo = Todo.find_by(id: params[:todo][:id])

    if @todo.blank?
      flash[:alert] = "Todo not found"
      @todos = Todo.where(user_id: Current.user.id).order(priority: :desc)
      return render :index, status: :unprocessable_entity
    end

    logger.debug "Parameters: #{params.inspect}"
    logger.debug "Todo before update: #{@todo.inspect}"
    @todo.updated_at = Time.now
    if @todo.update(todo_params)
      logger.debug "Todo after update: #{@todo.inspect}"
      redirect_to todos_path(view: 'all')
    else
      @todos = Todo.where(user_id: Current.user.id).order(priority: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private


  def check_user
    if Current.user.blank?
      flash[:alert] = "Please login to continue"
      redirect_to signin_path
    end
  end
  def todo_params
    puts params
    params.require(:todo).permit(:title, :description, :priority, :id, :status)
  end

end
