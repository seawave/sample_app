# == Schema Information
# Schema version: 20110508021658
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email

   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length   => { :maximum => 50 }
  #validates(:name, :presence => true)
  #validates(:email, :presence => true)


  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  #                  :uniqueness => true 
  #                  :uniqueness => { :case_sensitive => false }


end
