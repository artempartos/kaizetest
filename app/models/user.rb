class User < ActiveRecord::Base
  has_many :stories, :foreign_key => :creator_id, :inverse_of => :creator, :dependent => :destroy
  has_many :story_comments, :dependent => :destroy

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false },
                    :length   => { :minimum => 6 }
  validates :password, :length => { :within => 6..40 }


  validates_presence_of :password, :on => :create

  def self.auth(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.authenticate(submitted_password)
  end

end
