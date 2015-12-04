class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validate_presence_of :body, :user_id, :post_id
end