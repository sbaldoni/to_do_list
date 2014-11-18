class List < ActiveRecord::Base

   #add these two into List class
   belongs_to :user
   has_many :items

   validates_presence_of :name
   validates_length_of :name, maximum: 50
end