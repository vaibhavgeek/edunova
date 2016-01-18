class ProfilesController < ApplicationController

  def edit
    @profile = current_user
  end

  def destroy
     @delfed = Feed.find(params[:id])
     @delfed.destroy
  end
  def intrests
    if params[:query].to_s != 'allint'
    str = params[:query].to_s
    @search  = Intrest.select(:value , :id).where('lower(value) like ?', %(%#{str.downcase}%))
    else
    @search  = Intrest.select(:value , :id).all
    end
    render json: @search
  end
  
  def all_people
    if params[:query].to_s != 'allint'
    str = params[:query].to_s
    @search  = User.select(:name , :id , :username , :image_id).where('lower(name) like ?', %(%#{str.downcase}%))
    else
    @search  = User.select(:name , :id , :username , :image_id).all
    end
    render json: @search
  end
  
  def all_activity
     @user = User.friendly.find(params[:id])
     
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id
        Where 
        feeds.user_id = ' + @user.id.to_s).order(:created_at => :desc)
  end
  
  def following
         @user = User.friendly.find(params[:id])
my_frien_req = Relationship.where(:following_id => @user.id , :follower_id => @user.id) 
stuff =  Relationship.joins('
INNER JOIN users
ON relationships.following_id = users.id
WHERE relationships.follower_id = '+@user.id.to_s).order(:created_at => :asc)
 
    @allfollowing =  stuff - my_frien_req

 
  end
  
  def followers
       @user = User.friendly.find(params[:id])
      @allfollowers = Relationship.joins('
INNER JOIN users
ON relationships.follower_id = users.id
WHERE relationships.following_id = '+@user.id.to_s).order(:created_at => :desc)
  
  end


  def notes 
          @user = User.friendly.find(params[:id])
        @allnotes = Note.where(:user_id => @user.id) 
  end
  def show
   @user = User.friendly.find(params[:id])
     
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id
        Where 
        feeds.user_id = ' + @user.id.to_s).order(:created_at => :desc)
     
   @boolrel = Relationship.where(follower_id:current_user.id , following_id: @user.id ).count
  end
   def created
        @user = User.friendly.find(params[:id])
        @profile_create = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id').where(:set_type => 'create' , :user_id => @user.id).order(:created_at => :desc)
  end 
  def commented
      @user = User.friendly.find(params[:id])
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id').where(:set_type => 'comment' , :user_id => @user.id).order(:created_at => :desc)
  end 
   def played
     @user = User.friendly.find(params[:id])
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id').where(:set_type => 'play' , :user_id => @user.id).order(:created_at => :desc)
  end 
  def upvoted
       @user = User.friendly.find(params[:id])
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id').where(:set_type => 'upvote' , :user_id => @user.id).order(:created_at => :desc)
  end
  def all
      @user = User.friendly.find(params[:id])
     
        @profile_feeds = Feed.joins('INNER JOIN  users 
        ON feeds.user_id = users.id
        Where 
        feeds.user_id = ' + @user.id.to_s).order(:created_at => :desc)
  end

  def follow_user
      @user = User.friendly.find(params[:id])
      rel = Relationship.find_or_create_by(:follower_id => current_user.id , :following_id => @user.id)
      if rel.save
      sendnoti = Notification.new(:from_id => current_user , :to_id => @user , :read => 0 , :category => 'FYP' , :object_id => current_user.id )  
      sendnoti.save
      end
  end

  def destroy_follow_user
     @user = User.friendly.find(params[:id])
    rel = Relationship.where(:following_id => @user.id , :follower_id => current_user.id)
    sendnoti = Notification.where(:from_id => current_user , :to_id => @user , :category => 'FYP' , :object_id => current_user.id )  
    sendnoti.destroy_all 
     if rel.present?
       rel.destroy_all
     end
  end

  
 
  def update
    @profile = current_user
    
    if @profile.update_attributes(user_params)
      respond_to do |format|
      format.html { redirect_to profile_url(@profile) }
      format.js
         end
    else
       render "edit"
    end
    
  end
  private
  def user_params
    params.require(:user).permit( :username , :remove_image , :image ,:description,:dob ,:name ,:gender ,:intrested_in)
  end

end
