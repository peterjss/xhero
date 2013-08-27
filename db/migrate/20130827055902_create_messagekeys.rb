class CreateMessagekeys < ActiveRecord::Migration
  def change
    create_table :messagekeys do |t|
      t.string :name
      t.boolean :isMatch
      # t.integer :rolecard_id
      t.references :rolecard

      t.timestamps
    end
  end
end
