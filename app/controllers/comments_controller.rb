class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	before_action :set_comment, only:[:edit, :update, :show, :destroy]
	before_action :set_meeting

	def new
		@comment = comment.new
	end 

	def create
		@comment = @meeting.comments.create(params[:comment].permit(:reply, :meeting_id))
	    if @comment.save
	       puts 'comment:'+ @comment.reply+' true'
	    else 
	       puts 'comment:'+ @comment.reply+' false'
	    end
		@comment.user_id = current_user.id
		puts 'comment:'+@comment.reply
		respond_to do |format|
          if @comment.save
			format.html { redirect_to meeting_path(@meeting)}
			format.js #render create.js.erb
		  else
			format.html { redirect_to meeting_path(@meeting), notice: "your comment did not save"}
		  end
	    end
	end

	def destroy
		@comment = @meeting.comment.find(params[:id]);
		@comment.destroy
		redirect_to meeting_path(@meeting)
	end

	private

	  def set_meeting
	  	@meeting = Meeting.find(params[:meeting_id])
	  end

	  def set_comment
	  	@comment  = Comment.find(params[:id])
	  end

	  def comment_params
	  	params.require(comment).permit(:reply)
	  end
end
