class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.order_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def self.names
    pluck(:name)
  end

  def worked_with
    # Actor.select(:name).where('movie_actors.id = actors.id')
  end
end