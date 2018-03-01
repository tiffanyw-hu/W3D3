class AddUniquenessToEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email, :string, uniqueness: true
  end
end
