class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :alternative_titles
      t.string :year
      t.text :image
      t.string :color
      t.float :score
      t.integer :rating
      t.string :actors
      t.text :actor_facets
      t.string :genre
      t.integer :objectID

      t.timestamps
    end
  end
end
