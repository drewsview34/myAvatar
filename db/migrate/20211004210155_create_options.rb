class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.string :super_power
      t.string :super_weakness

      t.timestamps
    end
  end
end
