class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :msgType
      t.string :content

      t.string :picUrl

      t.string :locationx
      t.string :locationy
      t.string :scale
      t.string :label

      t.string :title
      t.string :description
      t.string :url

	  t.references :rolecard

      t.timestamps
    end
  end
end
