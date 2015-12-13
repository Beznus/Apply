class UserApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry


  has_attached_file :cover_letter, styles: {thumbnail: "60x60#"}
  validates_attachment :cover_letter, content_type: { :content_type => ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"] }

  has_attached_file :resume, styles: {thumbnail: "60x60#"}
  validates_attachment :resume, content_type: { :content_type => ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"] }
 
  APPLICATION_STATUSES = %w[New Review Closed]
end
