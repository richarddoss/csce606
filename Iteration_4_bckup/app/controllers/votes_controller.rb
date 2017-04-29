class VotesController < ApplicationController
  def create
    if params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.vote_options.find_by_id(params[:vote_option][:id])
      respond_to do |format|
        if @option && @poll 
          @option.votes.create()
          #render js: 'alert(\'Thanks for voting ! Results will anaylysed soon\');'
          #:flag=0;
          #redirect_to poll_path
          print('hello.................')
          flash[:success] = 'Thanks for Voting!'
          @poll=Poll.find_by_id params[:poll][:id]
          print(@poll.user_id)
          format.html { redirect_to user_polls_path(@poll.user_id) }
          format.json { render :show, status: :created, location: @question }
          print('bye.............')
        else
          render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
        end
      end
      
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end
  end
end
