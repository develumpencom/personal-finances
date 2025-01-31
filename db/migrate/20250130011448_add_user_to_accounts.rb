class AddUserToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_reference :accounts, :user, foreign_key: true

    Account.update_all(user_id: User.first.id)

    change_column_null :accounts, :user_id, false
  end
end
