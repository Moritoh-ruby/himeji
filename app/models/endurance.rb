class Endurance < ActiveRecord::Base
  belongs_to :user
  has_many :excuse
end
