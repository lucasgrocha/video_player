class CreateJwtTokenLists < ActiveRecord::Migration[6.0]
  def change
    create_table :jwt_token_lists do |t|
      t.string :jwt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
