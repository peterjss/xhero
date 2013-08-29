# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'admin', password: 'admin', realname: 'admin')


contacts = Contact.create([{openid: 'aaa', nickname: 'Peter'}])


Remessage.create(fromUserName: 'aaa', toUserName: 'bbb', msgType: 'text', content: 'test content.', contact_id: contacts.first.id)
Remessage.create(fromUserName: 'ccc', toUserName: 'bbb', msgType: 'text', content: 'test content2.')


role_cards = Rolecard.create([{name: 'role_1'}, {name: 'role_2'}])

Messagekey.create(name:'hello', isMatch: false, rolecard_id: role_cards.first.id);
Messagekey.create(name:'hi', isMatch: false, rolecard_id: role_cards.first.id);
Messagekey.create(name:'你好', isMatch: false, rolecard_id: role_cards.first.id);

   #    t.string :type
	  # t.references :rolecard
Message.create(msgType: 'text', content:'Hello!', rolecard_id: role_cards.first.id)


