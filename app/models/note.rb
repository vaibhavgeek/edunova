class Note < ActiveRecord::Base
    
extend FriendlyId
    friendly_id :name,  use: [:slugged, :finders] 
    acts_as_votable
  	belongs_to :user
	  has_many :comments
    validates_presence_of :name 
   
    has_many :notearticles, :dependent => :destroy
    accepts_nested_attributes_for :notearticles, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
    
def should_generate_new_friendly_id?

  if !slug? || name_changed? || new_record? || slug.nil? || slug.blank?
      true
    else
      false
    end
  end

def self.search(search)
  if search
    t = Note.arel_table
    Note.where(t[:name].matches("%#{search}%"))
  else
    where(nil)
  end
end


def self.isearch(search)
  if search
    t = Note.arel_table
    Note.where(t[:prereq].matches("%#{search}%"))
  else
    where(nil)
  end
end

end
