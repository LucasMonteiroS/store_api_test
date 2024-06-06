class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :sobrenome
      t.string :endereco

      t.timestamps
    end
  end
end
