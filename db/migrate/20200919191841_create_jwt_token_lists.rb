class CreateJwtTokenLists < ActiveRecord::Migration[6.0]
  def change
    create_table :jwt_token_lists do |t|
      t.string :jwt

      t.timestamps
    end
  end
end
