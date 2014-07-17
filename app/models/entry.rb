class Entry < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :author
end
