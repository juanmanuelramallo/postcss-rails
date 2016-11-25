class AddDescriptionToLibro < ActiveRecord::Migration[5.0]
  def change
    add_column :libros, :descripción, :string
  end
end
