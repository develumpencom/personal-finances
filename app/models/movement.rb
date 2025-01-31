class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :import, optional: true
  has_one :user, through: :account
end
