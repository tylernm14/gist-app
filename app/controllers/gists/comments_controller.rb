class Gists::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Gist.find(params[:gist_id])
  end

end
