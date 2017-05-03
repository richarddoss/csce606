class PollsController < ApplicationController
    before_action :set_poll, only: [:show, :edit ,:update ,:destroy]
  def index
    
    @polls = Poll.where(user_id: params[:user_id])
    if session[:flag]==0
     redirect_to poll_index1_path(params[:user_id])
    end
  end
  
  def index1
    
    @polls = Poll.where(user_id: params[:user_id])
    
    
  end

  def new
    @poll = Poll.new
    session[:flag]=0
    
  end
  
  def edit
    @poll = Poll.find(params[:id])
    print(@poll.topic)
     
  end
  
   def richi
    
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to user_poll_path(params[:user_id],@poll.id)
    else
      render 'edit'
    end
   end
   
   def update
    
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to signup_path
    else
      render 'edit'
    end
   end

def destroy
  @poll = Poll.find(params[:id])
  session[:flag]=0
  if @poll.destroy
    flash[:success] = 'Poll was destroyed!'
  else
    flash[:warning] = 'Error destroying poll...'
  end
  redirect_to user_polls_path
end

  def create
    @poll = Poll.new(poll_params)
    @poll.user_id=params[:user_id]
    if @poll.save!
      flash[:success] = 'Poll was created!'
      redirect_to user_polls_path
    else
      render 'new'
    end
  end
  
  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])

  end

  private
  
  def set_poll
    @poll=Poll.find(params[:id])
  end

  def poll_params
    
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
end
