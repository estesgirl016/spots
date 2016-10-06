class CommentsController < ApplicationController
	def create
    @spot = Spot.find(params[:id])
    @comment = @spot.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    	flash[:notice] = 'Comment Posted Successfully'
      redirect_to spot_path(@spot)
    else
    	flash[:alert] = 'Comment Did Not Post: ' + @comment.errors.full_messages.to_sentence
      redirect_to spot_path(@spot)
    end
  end

  def delete
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
    	flash[:notice] = 'Comment has been deleted'
    	redirect_to spot_path(@spot)
    else
    	flash[:alert] = 'Comment Not Deleted: ' + @comment.errors.full_messages.to_sentence
    	redirect_to spot_path(@spot)
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:body)
  end
end
