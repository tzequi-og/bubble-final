class Bubble < ApplicationRecord

  belongs_to :user1, required: true, class_name: "User", foreign_key: "user1_id"
  belongs_to :user2, required: true, class_name: "User", foreign_key: "user2_id"
  
end
