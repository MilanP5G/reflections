class CreateReflections < ActiveRecord::Migration[6.0]
  def change
    create_table :reflections do |t|
      t.string :title
      t.string :content
      t.integer :reflection_user_id
      t.integer :reflection_book_id

      t.timestamps
    end
  end
end
