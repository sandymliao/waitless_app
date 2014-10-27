class Guest < ActiveRecord::Base
  belongs_to :users
end
