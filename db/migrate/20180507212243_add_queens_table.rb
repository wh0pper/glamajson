class AddQueensTable < ActiveRecord::Migration[5.2]
  def change
    create_table :queens do |t|
      t.column :name, :string
    end

    create_table :seasons do |t|
      t.column :name, :string
    end

    create_join_table :queens, :seasons do |t|
      t.index [:queen_id, :season_id]
    end
  end
end
