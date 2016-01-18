class CommentsController < ApplicationController
	def create
		@note = Note.find(params[:note_id])
		@comment = @note.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.note_id = @note.id
		@comment.save



		if @note.user_id != current_user.id
			@user_creater_notification = Notification.new
			@user_creater_notification.to_id = User.find(@note.user_id) 
			@user_creater_notification.from_id = User.find(current_user.id)
			@user_creater_notification.note_id = @note.id
			@user_creater_notification.object_id = @comment.id
			@user_creater_notification.category = 'CONYC'
			@user_creater_notification.read = 0 
			@user_creater_notification.save
		end

		@all_people_commented = Comment.select(:user_id , :note_id  , :id).where(:note_id => @note.id)
			@all_people_commented.each do |sendnot|				
			if @note.user_id != sendnot.user_id
				if sendnot.user_id != current_user.id
					@newnotif = Notification.new
					@newnotif.to_id = User.find(sendnot.user_id)
					@newnotif.from_id = User.find(current_user.id)
					@newnotif.note_id = sendnot.note_id
					@newnotif.object_id = @comment.id
					@newnotif.category = 'CONYCT'
					@newnotif.read = 0
					if Notification.where(:to_id => User.find(sendnot.user_id) , :from_id =>  User.find(current_user.id) , :note_id => sendnot.note_id , :object_id => @comment.id , :category => 'CONYCT' , :read => 0 ).count == 0 
					@newnotif.save
				end
				    end	
			   end
			end
		updatefeed = Feed.new(:user_id => current_user.id , :object_id => @note.id  , :set_type => 'comment' , :comment_id =>@comment.id)           
        updatefeed.save 
	end

	def destroy
		@note = Note.find(params[:note_id])
		@comment = Comment.find(params[:id])
		
		@deletenotif = Notification.where(:from_id => current_user , :note_id => @note.id , :object_id => @comment.id)
		@deletenotif.destroy_all

		deletefeed = Feed.where(:user_id => current_user.id , :comment_id => @comment.id).first
		deletefeed.destroy
		@comment.destroy
		
	end

	private
	def comment_params
		params.require(:comment).permit(:comment ,{:user_id => [current_user.id]})
	end
end
