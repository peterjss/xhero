class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
	  t.references :rolecard

      t.timestamps
    end
  end
end
