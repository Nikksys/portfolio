 class Project < ApplicationRecord
   has_one_attached :picture
   has_rich_text :content
   
   attr_accessor :remove_p_picture

   after_save :purge_p_picture if :remove_p_picture
   private def purge_p_picture
     return unless @remove_p_picture == '1'
     picture.purge_later
   end
 end
 