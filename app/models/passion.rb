class Passion < ActiveRecord::Base
	validates :video_url, format: { with: /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/, message: "Please enter a valid youtube URL"}  
	 validates_presence_of :video_url
	  validates_presence_of :label
	belongs_to :user


end
