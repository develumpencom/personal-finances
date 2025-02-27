require "csv"

class ImportMovementsJob < ApplicationJob
  queue_as :default

  def perform(import_id)
    import = Import.find(import_id)

    column_names = Account::SETTINGS_FIELDS.reduce({}) { |acc, curr|
      acc[curr.to_s.sub("_column", "")] = import.account.send(curr) if curr.ends_with?("_column")
      acc
    }

    format_names = Account::SETTINGS_FIELDS.reduce({}) { |acc, curr|
      acc[curr.to_s.sub("_format", "")] = import.account.send(curr) if curr.ends_with?("_format")
      acc
    }

    CSV.parse(import.file.download, headers: true).each do |row|
      values = column_names.reduce({}) do |acc, curr|
        if curr[0] == "amount"
          acc[curr[0]] = Money.from_amount(row[curr[1]].to_f).cents
        else
          acc[curr[0]] = row[curr[1]]
        end
        acc
      end

      format_names.each do |key, value|
        values[key] = Date.strptime(values[key], value)
      end

      import.account.movements.create_with(import_id:).find_or_create_by(values)
    end
  end
end
