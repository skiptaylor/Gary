class Workshop
  include DataMapper::Resource
  
  property    :id,          Serial
  property    :deleted_at,  ParanoidDateTime
  timestamps  :at
  
  property :start_date,   Date,   :required => true, :default => Chronic.parse('now')
  property :end_date,     Date,   :required => true, :default => Chronic.parse('tomorrow')
  property :venue,        String, :required => true
  property :description,  Text,   :required => true

  property :nce,          Boolean, :default => false
  property :ncmhce,       Boolean, :default => false

  has n, :reservations
  
  def self.upcoming
    all(:end_date.gte => Chronic.parse('now'))
  end
  
end