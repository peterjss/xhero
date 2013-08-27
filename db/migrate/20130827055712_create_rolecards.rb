class CreateRolecards < ActiveRecord::Migration
  def change
    create_table :rolecards do |t|

      t.string :name
      t.timestamps
    end
  end
end
