class VotesController < ApplicationController
  def create
    if params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.vote_options.find_by_id(params[:vote_option][:id])
      if @option && @poll 
        @option.votes.create()
        render js: 'alert(\'Thanks for voting ! Results will anaylysed soon\');'
        #:flag=0;
        #redirect_to polls_path
      else
        render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end
  end
end
