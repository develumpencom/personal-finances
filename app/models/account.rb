class Account < ApplicationRecord
  has_many :movements, dependent: :destroy

  validates_presence_of :name
end
