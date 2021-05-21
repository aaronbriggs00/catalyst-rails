class Post < ApplicationRecord
  has_many :votes
  has_many :comments
  belongs_to :board
  belongs_to :user

  def score
    votes = self.votes.map do |vote| 
      vote.value
    end
    return votes.inject(0, :+)
  end
end
