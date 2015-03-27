class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :participant_user, only: [:index]

  def index
    @microposts = Micropost.all.paginate(page: params[:page], per_page: 15)
  end

  private

    def participant_user
      redirect_to root_url unless current_user.participant? or current_user.teacher?
    end


end
