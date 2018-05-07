class Quote < ApplicationRecord
  validates :content, presence: true
  validates :author, presence: true

  scope :search, -> (queen) { where("lower(author) LIKE ?", "#{queen.downcase}%") }
end
