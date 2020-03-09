class AddPostalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal, :integer
    add_column :users, :address, :string
  end
end
