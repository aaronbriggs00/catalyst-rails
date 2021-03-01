class Comment < ApplicationRecord
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  
  belongs_to :parent, class_name: "Comment", optional: true
end
