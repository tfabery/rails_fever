class Room < ActiveRecord::Base
  belongs_to :streamer
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
end
