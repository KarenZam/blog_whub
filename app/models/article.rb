class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  validates :title, presence: true
  validates :body, presence: true

  accepts_nested_attributes_for :tags

  def find_or_create_tags(tags_params)
    tags_params.each do |tag_params|
      tag = Tag.find_or_create_by(badge: tag_params[:badge])
      self.tags << tag
    end
  end
end
