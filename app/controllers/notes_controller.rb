class NotesController < ApplicationController
  def index
  	if params[:search] == ''
  		#redirect to path which has all the listed notes 
       redirect_to root_path
    elsif params[:search] and params[:search] != ''
  	   @notes = Note.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
    else
 		@notes = nil

    end
    if current_user
    @mynotes = Note.where(:user_id => current_user.id).paginate(:per_page => 7, :page => params[:page])
    end

   end
  
 def explore
    @labels = Intrest.all    
    @notes_filter = Note.all.paginate(:per_page => 25, :page => params[:page]) 
 end



def display_quiz
 @note = Note.friendly.find(params[:note_id])
 @questions_hash = ""

end

def display_quiz_result
@note = Note.friendly.find(params[:note_id])
 @questions_hash = ""
end



def discover 
  @passion = Passion.new
  @allpassion = Passion.all
end

def add_passion
@passion = Passion.new(passion_params)
@passion.user_id = current_user.id
@passion.save

end

def add_quiz


end


  def new
  	@note = Note.new
    @hash = AmazonSignature::data_hash
    @array_levels = [*1..6].to_json
  end


  def destroy
    @note = Note.friendly.find(params[:id])
    @deletefeed = Feed.where(:object_id => @note.id)
    @deletecommets = Comment.where(:note_id => @note.id )
    @deletenotifications = Notification.where(:note_id => @note.id)
    @deletefeed.destroy_all
    @deletecommets.destroy_all
    @deletenotifications.destroy_all
    @note.destroy
    @mynotes = Note.where(:user_id => current_user.id).paginate(:per_page => 7, :page => params[:page])
  end


  def create
   @note = Note.new(note_params)
   @hash = AmazonSignature::data_hash
   @labels = note_params[:prereq].split(",")
      @labels.each do |intr|
        Intrest.find_or_create_by(value: intr.strip.to_s)
      end  
   
   @note.total_levels = note_params[:file].to_s.split('<hr>').count
    if @note.total_levels <= 6
          @note.user_id = current_user.id
                 if @note.save
                   updatefeed = Feed.new(:user_id => current_user.id , :object_id => @note.id  , :set_type => 'create' , :fcontent => @note.note_from_author)           
                   updatefeed.save   
                   redirect_to :controller => 'notes', :action => 'show', :id => @note.id
                 else
                   render "new"
                 end
              
   end
  end


  def update
    @note = Note.friendly.find(params[:id])
     @labels = note_params[:prereq].split(",")
      @labels.each do |intr|
        Intrest.find_or_create_by(value: intr.strip.to_s)
      end  
   @note.total_levels = note_params[:file].to_s.split('<hr>').count
    if @note.total_levels <= 6
             
                 if @note.update(note_params)
                   redirect_to :controller => 'notes', :action => 'show', :id => @note.id
              end
   end
  end


  def edit
    @note = Note.friendly.find(params[:id])
    @hash = AmazonSignature::data_hash    
    if current_user.id == 51 || @note.user_id == current_user.id
      @array_levels = [*1..6].to_json
      @a,@b = "false"
              if @note.description == 'insight'
                @a = "true"
              else
                @b = "true"
              end
      else
       redirect_to notes_my_notes_path
      end
  end


  def show
   @note = Note.friendly.find(params[:id])
   @questions_hash = ''

   if current_user
   @get_level = Play.where(:user_id => current_user.id , :note_id => @note).first
  end

  end


  def comment_view  
       @note = Note.friendly.find(params[:note_id])
  end


  def my_notes
    @mynotes = Note.where(:user_id => current_user.id).paginate(:per_page => 7, :page => params[:page])
  end

  def upvote
    @note = Note.friendly.find(params[:id])
    @note.upvote_by current_user
    updatefeed = Feed.new(:user_id => current_user.id , :object_id => @note.id  , :set_type => 'upvote')           
    updatefeed.save
    if current_user.id != @note.user_id
    sendnotif = Notification.new(:to_id => User.find(@note.user_id) , :from_id => current_user , :read => 0 ,:category => 'UYN' , :note_id => @note.id )
    sendnotif.save
    end
  end
  
  def openlibrary
    
    
 end

 def search_results_videos
  videos = Yt::Collections::Videos.new
  if params[:selected_course][:course_tag] != 'all'
  @video_list = videos.where(q: params[:search].to_s , safe_search: 'none' , order: 'Relevance' , channel_id: params[:selected_course][:course_tag] ).first(4)
  else
  @video_list = videos.where(q: params[:search].to_s , safe_search: 'none' , order: 'Relevance').first(4)
  end 
 end
  def next_level
     @note = Note.friendly.find(params[:note_id])
     if  Play.where(:user_id => current_user.id , :note_id => @note.id ).count > 0
      play = Play.where(:user_id => current_user.id , :note_id => @note.id ).first
      p_cnt = play.p_count
      p_cnt = p_cnt + 1
    
        if play.current_level < params[:query].to_i
          play.update_attributes(:p_count => p_cnt , :current_level => params[:query].to_i)
        else
          play.update_attributes(:p_count => p_cnt)
        end
     else 
     play =  Play.new(:user_id => current_user.id , :note_id => @note.id , :p_count => 0 , :current_level => params[:query].to_i  )
     play.save
   end
   if @note.user_id != current_user.id 
     if play.current_level == @note.total_levels
      
         updatefeed = Feed.find_or_create_by(:user_id => current_user.id , :object_id => @note.id  , :set_type => 'play' )           
         updatefeed.save  
      end
      end
    
  end

  def unvote
    @note = Note.friendly.find(params[:id])
    @note.unvote_by current_user
    delfeedupvote = Feed.where(:user_id => current_user.id , :object_id => @note.id , :set_type => 'upvote')
    deletenotif =  Notification.where(:to_id => User.find(@note.user_id) , :from_id => current_user  ,:category => 'UYN' , :note_id => @note.id ).first
    if deletenotif
      deletenotif.destroy
    end
    delfeedupvote.destroy_all
 end


  private
  def note_params
   params.require(:note).permit(:name , :prereq , :file , :note_from_author , :description , :questions )
  end
  
  def passion_params
    params.require(:passion).permit(:label , :video_url)
  end

  
end
