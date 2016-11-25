class Pedido < ApplicationRecord
  has_and_belongs_to_many :libros
  belongs_to :user
end
