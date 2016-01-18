class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 extend FriendlyId
  friendly_id :username,  use: [:slugged, :finders] 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :confirmable, :omniauth_providers => [:facebook ,:google_oauth2 ]
attachment :image
validates :username, format: { with: /\A[a-z0-9\-_]+\z/i  }

 validates_presence_of :username
  validates_uniqueness_of :username
after_create :after_signup_action
has_many :intrests
  has_many :notes
  has_many :comments
  has_many :lists
  has_many :relationships, :class_name => "Relationship"
  has_many :feeds
  has_many  :plays
  has_many :notifications , :class_name => "Notification"
  acts_as_voter
before_save :default_username
  

  def should_generate_new_friendly_id?
  if !slug? || username_changed? || new_record? || slug.nil? || slug.blank?
      true
    else
      false
    end
  end

  def after_signup_action
  rel = Relationship.new
  rel.following_id = self.id
  rel.follower_id = self.id
  rel.save
  end

def self.search_name(search)
  if search
    t = User.arel_table
    User.where(t[:name].matches("%#{search}%"))
  else
    where(nil)
  end
end

def self.search_username(search)
  if search
    search = search.to_s[1..-1]
    t = User.arel_table
    User.where(t[:username].matches("%#{search}%"))
  else
    where(nil)
  end
end

def default_username

self.username ||= rand(1.100)

end
  
def self.from_omniauth(auth)
   uname = auth.info.first_name.downcase.parameterize
   max_slug = User.where("username like '#{uname}-%'")
  where(email: auth.info.email).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.gender = auth.extra.raw_info.gender
    user.skip_confirmation! 
    user.username = auth.uid.to_s
    if max_slug == nil
              max_count = 1
    else
            max_count = (max_slug.count.to_i + 1).to_s 
     end
            user.username =  "#{uname}-#{max_count}"
       end
 end




def self.from_omniauthg(access_token)
    data = access_token.info
    uname = access_token.info.first_name.downcase.parameterize
    max_slug = User.where("username like '#{uname}-%'")

    user = User.where(:email => data["email"]).first_or_create do |user|
                user.name = data["name"]
            user.gender = access_token.extra.raw_info.gender.to_s
            user.dob = access_token.extra.raw_info.birthday 
            user.skip_confirmation! 
            user.provider = access_token.provider.to_s 
            user.first_time_omniauth = 0
            user.password = Devise.friendly_token[0,20] 
            if max_slug == nil
              max_count = 1
            else
            max_count = (max_slug.count.to_i + 1).to_s 
            end
            user.username =  "#{uname}-#{max_count}"
      end
end




end