class AddDetailsToQueens < ActiveRecord::Migration[5.2]
  def change
    add_column :queens, :real_name, :string
    add_column :queens, :city, :string
    add_column :queens, :age, :integer
    remove_column :quotes, :author
  end
end
