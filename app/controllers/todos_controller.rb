class TodosController < ApplicationController
before_action:find_todo,:only=>[:edit,:destroy,:update,:change]

	def index
	@todo=Todo.new
	@todos=Todo.all
	end

	def change
	if @todo.status==true
	@todo.status=false
	elsif @todo.status==false
	@todo.status=true
	end
	if @todo.save
	redirect_to root_path
	end
	end

	def showDone
	@todos = Todo.where(status: true)
	end

	def showUndone
	@todos = Todo.where(status: false)
	end
	
	
	
	
	def create
	@todo=Todo.new(todo_params)
	@todo.update_attribute(:status,false)
	if @todo.save
	redirect_to root_path
	else
		render:new

	end
	end

	def edit
	end

	def destroy
	@todo.destroy
	redirect_to root_path
	end


	def update
		
		if @todo.update(todo_params)
			redirect_to root_path
		else
			render:edit
		end
	end
	
	
	
	private
	def  find_todo
		@todo=Todo.find(params[:id])
	end
	def todo_params
		params.require(:todo).permit(:eventName,:status)
	end
end
