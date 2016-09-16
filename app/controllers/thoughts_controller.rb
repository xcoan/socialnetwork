class ThoughtsController < ApplicationController

  before_action :require_user

  def new
    @thought = Thought.new
  end

  def edit
    @thought = Thought.find(params[:id])
  end

  def update
    @Thought = Thought.find(params[:id])

    if @thought.update(thought_params)
      redirect_to thoughts_path
    else
      render 'edit'
    end
  end

  def destroy
    @thought = Thought.find(params[:id])
    @thought.destroy

    redirect_to thoughts_path
  end

  def index
    @thoughts = Thought.all
  end

  def show
    @thought = Thought.find(params[:id])
  end

  def create
    @thought = current_user.thoughts.new(thought_params)

    if @thought.save
      redirect_to thoughts_path
    else
      render 'new'
    end
  end

  private

  def thought_params
    params.require(:thought).permit(:idea, :user_id)
  end
end
