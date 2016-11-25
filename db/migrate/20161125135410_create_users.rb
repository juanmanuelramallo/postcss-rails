class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :dir
      t.string :telf

      t.timestamps
    end
  end
end
