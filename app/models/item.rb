class Item < ActiveRecord::Base

   #add this one into Item class
   belongs_to :list

   validates_presence_of :name
   validates_length_of :name, maximum: 50
end