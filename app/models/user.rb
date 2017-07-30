require 'pry'
class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.happiness <=  self.nausea ? @mood = "sad" : @mood = "happy"
  end

  def enoughtix?
      self.attractions.last.tickets <= self.tickets if self.attractions != []
  end

  def tallenough?
    self.attractions.last.min_height <= self.height if self.attractions != []
  end

  def updated_tickets(tickets)
    self.tickets = self.tickets - tickets
    self.save
  end

  def updated_happiness(happiness)
   self.happiness = self.happiness + happiness
   self.save
  end

  def updated_nausea(nausea)
   self.nausea = self.nausea + nausea
   self.save
  end
end
