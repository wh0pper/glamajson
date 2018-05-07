class Queen < ApplicationRecord
  has_and_belongs_to_many :seasons
  has_many :quotes
  # validates :name, uniqueness: true
end
