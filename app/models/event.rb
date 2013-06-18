class Event < ActiveRecord::Base
  attr_accessible :title, :description, :total_number_of_tickets

  validates :title,       :presence => true
  validates :description, :presence => true
  validates :total_number_of_tickets, :presence => true
  validates :total_number_of_tickets, :numericality => { :only_integer => true, :greater_than => 0}

  has_many :reservations

  def number_of_tickets_available
    # Retrieve the total number of tickets for this event.
    # Retrieve the total number of tickets from valid reservations.
    # Subtract the total number of tickets for this event minus
    # the number of tickets reserved.
  	total_number_of_tickets - number_of_tickets_reserved
  end

  def number_of_tickets_reserved
    # For this event, find all reservations which are still valid
    # and sum all the number of tickets together to get a total
    # number of tickets reserved.
    reservations.valid.sum(:number_of_tickets)
  end

  def tickets_available?
    # This returns true if there are tickets avaiable for anyone.
    # This returns false if there are NO tickets available because
    # of maximum number of reserved tickets.
  	number_of_tickets_available > 0
  end

  def tickets_available_for_user?(user)
    # For this event and for the given user, 
    # fnid all reservations and sum all the number of tickets
    # together to get the number of tickets reserved.
    # Check whether this number is smaller than 2. If so, return true,
    # if not, return false.
    number_of_tickets_for_user = user.reservations.valid.where(:event_id => id).sum(:number_of_tickets)
    number_of_tickets_for_user < 2
  end

  def tickets_available_for_user(user)
    # For this event and for this user, find all the 
    # valid reservations and sum the number of tickets
    # together. Since a user is able to buy 2 tickets
    # per event, we need to subtract this number from 2.
    # So if a user has 1 reservations with 1 number of ticket,
    # then that user can still reserve 1 ticket.
    2 - user.reservations.valid.where(:event_id => id).sum(:number_of_tickets)
  end

  def tickets_available_options(user)
    tickets_available = tickets_available_for_user(user)

    if tickets_available == 1
      [1]
    else
      [1,2]
    end
  end
end
