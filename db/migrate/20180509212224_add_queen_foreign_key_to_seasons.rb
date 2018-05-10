class AddQueenForeignKeyToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_reference :seasons, :winner, foreign_key: { to_table: :queens } 
  end
end
