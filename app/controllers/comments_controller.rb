class CommentsController < ApplicationController
  def create
    # fetches the record that the comment will belong to
    @commentable = find_commentable
    @comment = @commentable.comments.new
    @comment.reply = params[:comment][:reply]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment was added!"
      redirect_to url_for @commentable
    else
      redirect_to :back
    end
  end


  private

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
