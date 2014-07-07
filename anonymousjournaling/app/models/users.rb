class Users < ActiveRecord::Base
  has_many :entries
end
