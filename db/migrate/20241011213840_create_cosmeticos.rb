class CreateCosmeticos < ActiveRecord::Migration[7.1]
  def change
    create_table :cosmeticos do |t|
      t.string :nombre
      t.string :categoria
      t.decimal :precio
      t.text :descripcion

      t.timestamps
    end
  end
end
