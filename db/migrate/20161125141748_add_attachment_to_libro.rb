class AddAttachmentToLibro < ActiveRecord::Migration[5.0]
  def up
    add_attachment :libros, :portada
  end

  def down
    remove_attachment :libros, :portada
  end
end
