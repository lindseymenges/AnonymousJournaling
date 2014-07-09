class Entry < ActiveRecord::Base
  attr_accessible :content, :user_id, :author
end
