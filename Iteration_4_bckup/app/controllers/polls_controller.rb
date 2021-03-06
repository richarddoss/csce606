class PollsController < ApplicationController
    before_action :set_poll, only: [:show, :edit ,:update ,:destroy]
  def index
    #@user=User.find_by_id(params[:id])
    @polls = Poll.where(user_id: params[:user_id])
    #@polls = Poll.all
    
  end

  def new
    @poll = Poll.new
    print("WWWWWWWWWWWWWWWW")
  end
  
  def edit
    @poll = Poll.find(params[:id])
    print(@poll.topic)
     print("say edit............................")
  end
  
   def richi
    print("say hello..................")
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to user_poll_path(params[:user_id],@poll.id)
    else
      render 'edit'
    end
   end
   
   def update
    print("say hello..................")
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to user_poll_path(params[:user_id],@poll.id)
    else
      render 'edit'
    end
   end

def destroy
  @poll = Poll.find(params[:id])
  print(@poll.topic)
  if @poll.destroy
    flash[:success] = 'Poll was destroyed!'
  else
    flash[:warning] = 'Error destroying poll...'
  end
  redirect_to user_polls_path
end

  def create
    print("hell\n")
    print("hello\n")
    @poll = Poll.new(poll_params)
    @poll.user_id=params[:user_id]
    #@poll.vote_options.first.id=1
    #print("hell\n")
    #@poll.vote_options.first.poll_id=1
    print(@poll.vote_options.first.title)
    print("hello\n")
    print(@poll.vote_options.first.id)
    print("Hello\n")
    if @poll.save!
      print("hell\n")
      print("hello\n")
      flash[:success] = 'Poll was created!'
      redirect_to user_polls_path
    else
      print("fail")
      render 'new'
    end
  end
  
  def show
    #@poll = Poll.find_by_id(params[:id])
    
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
