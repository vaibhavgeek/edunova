class Notification < ActiveRecord::Base

belongs_to :to_id , :class_name => "User" , :foreign_key => :to_id
belongs_to :from_id , :class_name => "User" , :foreign_key => :from_id

end
