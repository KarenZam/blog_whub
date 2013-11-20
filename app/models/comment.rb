class Comment < ActiveRecord::Base
  belongs_to :article, dependent: :destroy
  belongs_to :user
  validates :body, presence: true
  validates :user, presence: true
  
end
