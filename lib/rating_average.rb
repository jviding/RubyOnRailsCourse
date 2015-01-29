module RatingAverage
  def average_rating
    if ratings.empty?
      "beer has not yet been rated!"
    else
      "#{ratings.average(:score)}"
    end
  end
end