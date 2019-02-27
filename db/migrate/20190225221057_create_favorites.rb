class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :api_key
      t.string :location

      t.timestamps
    end
  end
end
