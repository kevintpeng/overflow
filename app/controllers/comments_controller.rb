class CommentsController < ApplicationController
  def create
    # fetches the record that the comment will belong to
    @commentable = find_commentable
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment was added!"
      redirect_to :back
    else
      redirect_to :back
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:reply)
  end

  def find_commentable   # gets the type of comment to create
    params.each do |name, value|
      # matches the type of id using regex
      if name =~ /(.+)_id$/
        # returns the active record being referenced
        # using constantize converts the string to any defined constant
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
