class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club

  def beer_club_name
      "#{beer_club.name}"
  end

  def member_name
      "#{user.username}"
  end
end
