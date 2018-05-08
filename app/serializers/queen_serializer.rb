class QueenSerializer < ActiveModel::Serializer
  attributes (:name, :real_name, :city, :age)
  has_many :quotes
end
