class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { greater_than_or_equal_to: 1042, only_integer: true}
  validate :year_is_less_than_today

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established in year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2015
    puts "changed year to #{year}"
  end

  def year_is_less_than_today
    if year > Date.today.year
      errors.add(:year, "can't be in the future")
    end
  end

end
