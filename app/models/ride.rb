class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by(id: self.user_id)
    if !user.enoughtix? && !user.tallenough?
     "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !user.enoughtix?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !user.tallenough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.updated_tickets(attraction.tickets)
      user.updated_happiness(attraction.happiness_rating)
      user.updated_nausea(attraction.nausea_rating)
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
