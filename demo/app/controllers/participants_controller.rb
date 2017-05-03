class ParticipantsController < ApplicationController
  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end
  
  def index
    @polls = Poll.where(user_id: params[:user_id])
  end

  def create
    session[:flag]=1
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to user_polls_path(@participant.user_id)
    else
      render 'new'
    end
  end

  private

    def participant_params
      params.require(:participant).permit(:name, :major, :user_id )
    end
end
