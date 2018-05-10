class UpdateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.column :type, :string
      t.column :descriptions, :string
      t.column :winner, :string
      t.references :episode, index: true
    end

    add_column :episodes, :bottom_two, :string
    add_column :episodes, :elimated, :string
    add_column :episodes, :winner, :string
    add_column :episodes, :lip_synch, :string

    create_join_table :episodes, :queens do |t|
      t.index [:episode_id, :queen_id]
    end
  end
end
