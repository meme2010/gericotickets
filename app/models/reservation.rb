class Reservation < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :expires_at, :number_of_tickets, :user

  belongs_to :event
  belongs_to :user
  has_one :payment

  validates :event_id,       :presence => true
  validates :user_id, :presence => true
  validates :expires_at, :presence => true
  validates :number_of_tickets, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 2}

  #  expires_at is set to 15 minutes from now.

  after_initialize do |user|
    user.expires_at = 15.minutes.from_now
  end

  # find all reservations which are not expired yet
  scope :valid, lambda { where("expires_at > ?", Time.zone.now ) }
end
