class Event < ActiveRecord::Base
  attr_accessible :title, :description, :total_number_of_tickets

  validates :title,       :presence => true
  validates :description, :presence => true
  validates :total_number_of_tickets, :presence => true
  validates :total_number_of_tickets, :numericality => { :only_integer => true, :greater_than => 0}

  has_many :reservations

  def number_of_tickets_available
  	total_number_of_tickets - number_of_tickets_reserved
  end

  def number_of_tickets_reserved
    # to get a total
    # number of tickets reserved.
    reservations.valid.sum(:number_of_tickets)
  end

  def tickets_available?
    # True if tickets available ffalse if not
  	number_of_tickets_available > 0
  end

  def tickets_available_for_user?(user)
    # true if number_of_tickets_for_user < 2, false if number_of_tickets_for_user > 2
    number_of_tickets_for_user = user.reservations.valid.where(:event_id => id).sum(:number_of_tickets)
    number_of_tickets_for_user < 2
  end

  def tickets_available_for_user(user)
    # if a user has 1 reservations with 1 number of ticket,
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
