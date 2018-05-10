class FixTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :episodes, :elimated, :eliminated
  end
end
