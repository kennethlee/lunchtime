class Suggestion < ActiveRecord::Base
  validates :user_id, presence: true

  acts_as_votable

  belongs_to :user
end
