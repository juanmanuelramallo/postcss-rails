class CreateLibros < ActiveRecord::Migration[5.0]
  def change
    create_table :libros do |t|
      t.string :nombre
      t.string :editorial
      t.string :portada
      t.integer :año_publicación

      t.timestamps
    end
  end
end
