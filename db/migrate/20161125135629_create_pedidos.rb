class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.date :fecha
      t.integer :user_id

      t.timestamps
    end

    create_table :libros_pedidos, id: false do |t|
      t.belongs_to :libro, index: true
      t.belongs_to :pedido, index: true
    end
  end
end
