class CreateBibliotecas < ActiveRecord::Migration[5.0]
  def change
    create_table :bibliotecas do |t|
      t.string :nombre
      t.string :dir
      t.string :telf
      t.string :imagen

      t.timestamps
    end

    create_table :bibliotecas_libros, id: false do |t|
      t.belongs_to :biblioteca, index: true
      t.belongs_to :libro, index: true
    end
  end
end
