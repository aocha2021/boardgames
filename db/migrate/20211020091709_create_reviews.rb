class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :content
      t.float :design
      t.float :luck
      t.float :easy
      t.float :strategy
      t.float :teamwork

      t.timestamps
      t.index [:user_id, :game_id], unique: true
    end
  end
end
