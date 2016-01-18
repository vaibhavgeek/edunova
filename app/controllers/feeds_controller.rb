class FeedsController < ApplicationController
  def followers
  	@allfollowers = Relationship.joins('
INNER JOIN users
ON relationships.follower_id = users.id
WHERE relationships.following_id = '+current_user.id.to_s).order(:created_at => :desc)
  end
def destroy
  @delfed = Feed.find(params[:id])
  @delfed.destroy
end
  def following
	@allfollowing = Relationship.joins('
INNER JOIN users
ON relationships.following_id = users.id
WHERE relationships.follower_id = '+current_user.id.to_s).order(:created_at => :asc)
  end
  def newsfeed
  	@feeds = Feed.joins('INNER JOIN relationships
ON relationships.following_id = feeds.user_id
INNER JOIN  users 
ON relationships.following_id = users.id
Where 
relationships.follower_id = '+ current_user.id.to_s).order(:created_at => :desc).paginate(:per_page => 12, :page => params[:page])
  end

  def index
  @feeds = Feed.joins('INNER JOIN relationships
ON relationships.following_id = feeds.user_id
INNER JOIN  users 
ON relationships.following_id = users.id
Where 
relationships.follower_id = '+ current_user.id.to_s).order(:created_at => :desc).paginate(:per_page => 12, :page => params[:page])
  end

 def destroy_follow_user
    @user = User.find(params[:id])
    rel = Relationship.where(:following_id => @user.id , :follower_id => current_user.id)
    sendnoti = Notification.where(:from_id => current_user , :to_id => @user , :category => 'FYP' , :object_id => current_user.id )  
    sendnoti.destroy_all 
     if rel.present?
       rel.destroy_all
     end
  end
 def follow_user
      @user = User.find(params[:id])
      rel = Relationship.find_or_create_by(:follower_id => current_user.id , :following_id => @user.id)
      if rel.save
      sendnoti = Notification.new(:from_id => current_user , :to_id => @user , :read => 0 , :category => 'FYP' , :object_id => current_user.id )  
      sendnoti.save
      end
  end

  def search_results


    if params[:search] and params[:search] != ''
        
        if params[:search].to_s.start_with?('@') 
            @peoples = User.search_username(params[:search]).paginate(:per_page => 25, :page => params[:page])
        
        else
            @peoples = User.search_name(params[:search]).paginate(:per_page => 25, :page => params[:page])        
         end 
      
    end
  end

  
end
