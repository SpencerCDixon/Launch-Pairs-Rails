class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.string :avatar_url
      t.string :blog_url
      t.string :facebook
      t.string :twitter
      t.string :github
      t.string :linked_in
      t.string :phone_number
      t.string :email

      t.timestamps null: false
    end
  end
end
