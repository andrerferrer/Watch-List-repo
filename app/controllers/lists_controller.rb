class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end


  # GET show
  #   assigns the requested list as @list (FAILED - 6)
  # GET new
  #   assigns a new list as @list (FAILED - 7)
  # POST create
  #   with valid params
  #     creates a new List (FAILED - 8)
  #     assigns a newly created list as @list (FAILED - 9)
  #     redirects to the created list (FAILED - 10)
  #   with invalid params
  #     assigns a newly created but unsaved list as @list (FAILED - 11)
  #     re-renders the 'new' template (FAILED - 12)
