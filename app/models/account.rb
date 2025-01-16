class Account < ApplicationRecord
  has_many :movements, dependent: :destroy

  SETTINGS_FIELDS = [ :transaction_date_column,
                      :transaction_date_format,
                      :post_date_column,
                      :post_date_format,
                      :description_column,
                      :amount_column ]

  store :import_settings, accessors: [ *SETTINGS_FIELDS ]

  validates_presence_of :name
end
