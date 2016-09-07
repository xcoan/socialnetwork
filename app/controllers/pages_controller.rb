class PagesController < ApplicationController

  def index
    if current_user
      redirect_to thoughts_path
    end
  end

  def invalid
  end
end
