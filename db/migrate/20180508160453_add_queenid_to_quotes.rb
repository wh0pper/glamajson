class AddQueenidToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quotes, :queen, index: true
  end
end
