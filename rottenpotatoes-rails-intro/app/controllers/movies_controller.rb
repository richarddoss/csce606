class MoviesController < ApplicationController
  
  #params[:ratings]={"G"=>"1",'PG'=>"1",'PG-13'=>"1", "R"=>"1"}
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  
    def index
      #  defaults = {:ratings=>["G"=>"1","PG"=>1,"PG-13"=>1,"R"=>"1"]}
      #  params = defaults.merge(params)
        @all_ratings=['G','PG','PG-13','R']
        #params[:ratings]={"G"=>"1", "R"=>"1"}
        #if params[:ratings].keys!=['G','PG','PG-13','R']
      #  @movies=Movie.where("rating IN (?)", params[:ratings].keys).order(params[:sort_by])
        #@movies=Movie.where("rating IN (?)", params[:ratings].keys).order(params[:sort_by])
        @movies = Movie.order(params[:sort_by])
        @movies = @movies.where("rating IN (?)", params[:ratings].keys) if params[:ratings].present?
    
        if params[:sort_by] == 'title'
          @title_header = 'hilite'
        elsif params[:sort_by] == 'release_date'
          @release_header ='hilite'
        end
    end
    #end
  

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
