class Import < ApplicationRecord
  belongs_to :account

  has_many :movements

  has_one_attached :file

  validates_presence_of :file
end
