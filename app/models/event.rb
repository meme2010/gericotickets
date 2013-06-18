class Event < ActiveRecord::Base
  attr_accessible :title, :description, :total_number_of_tickets

  validates :title,       :presence => true
  validates :description, :presence => true
  validates :total_number_of_tickets, :presence => true
  validates :total_number_of_tickets, :numericality => { :only_integer => true, :greater_than => 0}

  has_many :reservations

  def number_of_tickets_available
  	total_number_of_tickets - number_of_valid_reservations
  end

  def number_of_valid_reservations
  	reservations.valid.size
  end

  def tickets_available?
  	number_of_tickets_available > 0
  end
end
