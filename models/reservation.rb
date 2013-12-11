class Reservation
  include DataMapper::Resource
  
  property    :id,          Serial
  property    :deleted_at,  ParanoidDateTime
  timestamps  :at
  
  property :name, String
  property :email, String

  belongs_to :workshop
  
end