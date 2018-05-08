class QueenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :real_name, :city, :age
  has_many :quotes
end
