class Libro < ApplicationRecord
  has_and_belongs_to_many :bibliotecas
  has_and_belongs_to_many :pedidos

  has_attached_file :portada, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :portada, content_type: /\Aimage\/.*\z/
end
