class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.admin_id = 1

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign
    p "PARAMS!! " * 50
    p params
    respond_to do |format|
      if @movie.update(movie_params)
      else
      end
    end
  end

  def upvote
      @movie = Movie.find(params[:id])
      if @movie.reviews.first.reviewer == current_user
        @movie.upvote_by current_user
        @movie.reviews.first.update(thumb_is_up: true)
        redirect_to :back
      else
        redirect_to :back
      end
    end

  def downvote
    @movie = Movie.find(params[:id])
   if @movie.reviews.first.reviewer == current_user
     @movie.downvote_by current_user
     @movie.reviews.first.update(thumb_is_up: false)
     redirect_to :back
     puts "hello"
   else
    redirect_to :back
   end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:admin_id, :title, :tagline, :image_url, :director, :producer, :description, :authorized_reviewer)
    end
end
