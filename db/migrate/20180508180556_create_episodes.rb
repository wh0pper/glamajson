class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.column :number_in_series, :integer
      t.column :number_in_season, :integer
      t.column :title, :string
      t.column :airdate, :string
    end
  end
end
