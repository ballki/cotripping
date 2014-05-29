class Trip < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('start DESC') }
  validates :user_id, presence: true

end
