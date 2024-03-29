class Asset < ActiveRecord::Base
  belongs_to :user
  has_attached_file :uploaded_file, 
  					:url => "/assets/get/:id",
               		:path => ":rails_root/assets/:id/:basename.:extension",
               		:default_url => "public/404.html"
  do_not_validate_attachment_file_type :uploaded_file
  validates_with AttachmentSizeValidator, :attributes => :uploaded_file, :less_than => 5.megabytes
  validates_with AttachmentPresenceValidator, :attributes => :uploaded_file
end
