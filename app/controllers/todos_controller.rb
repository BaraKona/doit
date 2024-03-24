class TodosController < ApplicationController
  def index
    @todos = Todo.all # Fetch all todos from the database
  end

  # create a new todo
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

end
