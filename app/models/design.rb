class Design < ApplicationRecord
  has_one_attached :picture
  has_rich_text :content  
  attr_accessor :remove_picture
  after_save :purge_picture if :remove_picture
  scope :published, -> { where(online: true) }
  scope :offline, -> { where(online: false) }
  
  private
  
  def purge_picture
    return unless @remove_picture == '1'
    picture.purge_later
  end
  
end
