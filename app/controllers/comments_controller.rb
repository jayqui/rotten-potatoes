class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_commentable, only: [:new, :create]
  before_action :determine_movie, only: [:new, :create]
  before_action :commentable_of_comment, only: [:update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user
    @comment.commentable = @commentable

    respond_to do |format|
      if @comment.save
        format.html { redirect_to determine_movie, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to commentable_of_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to commentable_of_comment, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def load_commentable
      @commentable = Movie.find(params[:movie_id]) if params[:movie_id]
      @commentable = Review.find(params[:review_id]) if params[:review_id]
    end

    def determine_movie
      if @commentable.is_a?(Movie)
        return @commentable
      elsif @commentable.is_a?(Review)
        return @commentable.movie
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def commentable_of_comment
      if @comment.commentable.is_a?(Movie)
        return @comment.commentable
      elsif @comment.commentable.is_a?(Review)
        return @comment.commentable.movie
      end
    end
end
