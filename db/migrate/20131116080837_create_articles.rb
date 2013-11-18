class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.boolean :is_published
      t.text :body

      t.timestamps
    end
  end
end
