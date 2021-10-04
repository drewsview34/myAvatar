class CreateAvatar < ActiveRecord::Migration[6.1]
  def change
    create_table :avatars do |t|
      t.string :avatar_name
      t.integer :option_id
      t.integer :user_id

      t.timestamps
    end
  end
end
