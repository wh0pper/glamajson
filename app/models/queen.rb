class Queen < ApplicationRecord
  has_and_belongs_to_many :seasons
  has_many :quotes
  has_and_belongs_to_many :episodes

  # validates :name, uniqueness: true

  scope :search_by_name, -> (search_term) { where("name like ?", "%#{search_term}%")}
  scope :search_for_winners, -> { where('id IN (?)', Season.all.pluck(:winner_id)) }
  scope :search_for_serial, -> { joins(:seasons).group('queens.id').having('count(queen_id) > 1')}
end
