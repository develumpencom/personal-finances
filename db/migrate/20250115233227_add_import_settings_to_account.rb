class AddImportSettingsToAccount < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :import_settings, :text
  end
end
