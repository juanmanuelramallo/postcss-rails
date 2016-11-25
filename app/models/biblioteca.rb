class Biblioteca < ApplicationRecord
  has_and_belongs_to_many :libros
end
