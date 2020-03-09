class AddPrefToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pref, :string
  end
end
