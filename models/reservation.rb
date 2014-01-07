class Reservation
  include DataMapper::Resource
  
  property    :id,          Serial
  property    :deleted_at,  ParanoidDateTime
  timestamps  :at
  
  property :name,     String
  property :email,    String
  property :address1, String
  property :address2, String
  property :city,     String
  property :state,    String
  property :zip,      String
  property :phone,    String
  property :mobile,   String
  
  property :argosy,   Boolean, default: false

  belongs_to :workshop
  
end