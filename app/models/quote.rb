class Quote < ApplicationRecord
  belongs_to :queen
  validates :content, presence: true

  scope :search, -> (queen) { where("lower(author) LIKE ?", "#{queen.downcase}%") }
end
