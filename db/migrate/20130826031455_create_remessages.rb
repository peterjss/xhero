class CreateRemessages < ActiveRecord::Migration
  def change
    create_table :remessages do |t|
      t.string :toUserName
      t.string :fromUserName
      t.string :createTime
      t.string :msgType
      t.string :content
      t.string :msgId

      t.string :picUrl

      t.string :locationx
      t.string :locationy
      t.string :scale
      t.string :label

      t.string :title
      t.string :description
      t.string :url
      t.timestamps
    end
  end
end
