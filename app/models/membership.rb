class Membership < ApplicationRecord
  validates :gym_id, presence: true
  validates :client_id, presence: true
  validates :charge, presence: true
  validates :client_id, uniqueness: { scope: :gym_id}
  belongs_to :gym
  belongs_to :client
end
