class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.reference :twitterID
      t.text :title
      t.text :body
      t.string :bodyURL

      t.timestamps
    end
  end
end
