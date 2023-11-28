class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :description
      t.boolean :visible, default: true

      t.timestamps # created_at & updated_at
    end
  end
end
