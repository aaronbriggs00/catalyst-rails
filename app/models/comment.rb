class Comment < ApplicationRecord
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  has_many :votes
  
  belongs_to :parent, class_name: "Comment", optional: true
  belongs_to :post

  belongs_to :user

  def score
    votes = self.votes.map do |vote| 
      vote.value
    end
    return votes.inject(0, :+)
  end
end
