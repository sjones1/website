class FundraisersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  before_action :teacher_user, only: [:edit, :update, :new, :create, :destroy]

  def index
    @fundraisers = Fundraiser.all
  end

  def show
    @fundraiser = Fundraiser.find(params[:id])
  end

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.new(fundraiser_params) 
    if @fundraiser.save
      flash[:success] = "Created successfully!"
      redirect_to @fundraiser
    else
      render 'new'
    end
  end

  def edit
    @fundraiser = Fundraiser.find(params[:id])
  end

  def update
    @fundraiser = Fundraiser.find(params[:id])
    if @fundraiser.update_attributes(fundraiser_params)
      flash[:success] = "Updated"
      redirect_to @fundraiser
    else
      render 'edit'
    end
  end

  def destroy
    Fundraiser.find(params[:id]).destroy
    flash[:danger] = "Deleted"
    redirect_to fundraisers_url
  end


  private

    def fundraiser_params
      params.require(:fundraiser).permit(:title, :date, :content)
    end


    def teacher_user
      redirect_to(root_url) unless current_user.teacher?
    end

end
