class FundraisersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :teacher_user, only: [:new, :create, :edit, :update, :destroy]
  def show
    @fundraiser = Fundraiser.find(params[:id])
  end

  def index
    @fundraisers = Fundraiser.paginate(page: params[:page])
  end

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.new(fundraiser_params)
    if @fundraiser.save
      flash[:success] = "Fundraiser Created"
      redirect_to @fundraiser
    else 
      render 'new'
    end
  end

  def edit
    @fundraiser = Fundraiser.find(params[:id])
  end

  def update
    if @fundraiser.update_attributes(fundraiser_params)
      flash[:success] = "Fundraiser Updated"
      redirect_to "/fundraiser/#{@fundraiser.id}"
    else
      render 'edit'
    end
  end

  def destroy
    Fundraiser.find(params[:id]).destroy
    flash[:danger] = "Fundraiser deleted"
    redirect_to fundraisers_url
  end




  private
    def fundraiser_params
      params.require(:fundraiser).permit(:title, :content, :date)
    end

    def teacher_user
      redirect_to(root_url) unless current_user.teacher?
    end


end
