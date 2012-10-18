class User < ActiveRecord::Base
  has_many :my_stories, :foreign_key => :creator_id, :dependent => :destroy
  has_many :stories_for_me, :foreign_key => :performer_id
  has_many :comments, :dependent => :destroy

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :name,  :presence => true
  validates :email, :email   => true,
                    :presence => true,
                    :uniqueness => { :case_sensitive => false }


  validates :password, :length => { :within => 6..40 }

  validates_presence_of :password, :on => :create

  def self.auth(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.authenticate(submitted_password)
  end

end
