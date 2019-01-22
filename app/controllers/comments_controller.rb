class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      # format.json { render action: 'show', status: :created, location: @gist }
      end
    else
      redirect_to @commentable, alert: "Something went wrong"
    end
  end

  def destroy
    puts "Tryong to destroy"
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:parent_id, :body)
  end
end