class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :body, presence: true
  validates :user, presence: true
  
end
