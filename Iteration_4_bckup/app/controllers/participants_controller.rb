class ParticipantsController < ApplicationController
    def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    print("hello\n")
    print(@participant.user_id)
    print("hello")
    if @participant.save
      print("success")
      #flash[:success] = "Welcome to the Sample App!"
      #redirect_to user_polls(@participant.admin_id)
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
