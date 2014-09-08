class Entry < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :author
  validates :title, presence: true
  validates :content, presence: true
end
