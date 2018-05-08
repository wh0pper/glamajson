class Season < ApplicationRecord
  has_and_belongs_to_many :queens
  has_many :episodes
end
