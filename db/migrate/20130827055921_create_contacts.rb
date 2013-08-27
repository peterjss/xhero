class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :openid
      t.string :nickname
      
      t.timestamps
    end
  end
end
