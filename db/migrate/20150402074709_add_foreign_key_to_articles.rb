class AddForeignKeyToArticles < ActiveRecord::Migration
  def change
    add_foreign_key 'articles', 'authors', name: 'articles_author_id_fk', on_delete: :cascade
  end
end
