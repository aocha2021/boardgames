class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :producer
      t.date :release

      t.timestamps
    end
  end
end
