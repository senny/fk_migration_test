class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :author, index: true
      t.string :title

      t.timestamps null: false
    end
  end
end
