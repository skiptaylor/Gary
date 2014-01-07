class Workshop
  include DataMapper::Resource
  
  property    :id,          Serial
  property    :deleted_at,  ParanoidDateTime
  timestamps  :at
  
  property :start_date,   Date,    :required => true, :default => Chronic.parse('now')
  property :end_date,     Date,    :required => true, :default => Chronic.parse('tomorrow')
  property :venue,        String,  :required => true
  property :description,  Text 
  property :program,      String
  property :location,     String,  :default => 'Argosy University'
  property :address1,     String,  :default => '980 Hammond Drive'
  property :address2,     String
  property :city,         String,  :default => 'Atlanta'
  property :state,        String,  :default => 'GA'
  property :zip,          String,  :default => '30303'
  property :time,         String,  :default => '8am - 5pm'
  property :price1,       String
  property :price2,       String

  has n, :reservations, :constraint => :destroy
  
  def self.upcoming
    all(:end_date.gte => Chronic.parse('now'))
  end
  
  def self.expired
    all(:end_date.lt => Chronic.parse('now'))
  end
  
  def self.total
    all(:end_date.lt => Chronic.parse('now')).count + 126
  end
  
end