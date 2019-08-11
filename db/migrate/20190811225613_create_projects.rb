class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :source
      t.string :img_src

      t.timestamps
    end
  end
end
