class Quote < ApplicationRecord
  belongs_to :queen, optional: true
  validates :content, presence: true

  scope :search, -> (queen) { where("lower(author) LIKE ?", "#{queen.downcase}%") }
end
