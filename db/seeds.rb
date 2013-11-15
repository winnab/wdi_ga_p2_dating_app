# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Message.destroy_all

user1 = User.create(first_name: "Bob", last_name:"Tester", email: "bob@bob.com", password: "bob12345", confirmed_at: DateTime.now)
user2 = User.create(first_name: "Alice", last_name:"Tester", email: "alice@alice.com", password: "alice12345", confirmed_at: DateTime.now)
user3 = User.create(first_name: "Kate", last_name:"Tester", email: "kate@kate.com", password: "kate12345", confirmed_at: DateTime.now)

# Bob messages Alice
message1 = Message.create(sender_id: user1.id, recipient_id: user2.id, content: "Hello Alice, from Bob")
# Alice messages Bob
message2 = Message.create(sender_id: user2.id, recipient_id: user1.id, content: "Hello Bob, from Alice")
# Alice also messages Kate
message3 = Message.create(sender_id: user2.id, recipient_id: user3.id, content: "Hello Kate, from Alice")


# Bob has 2 messages (1 sent to Alice, 1 from Alice)
# Alice has 3 messages (1 from Bob, 1 to Bob, 1 to Kate)
# Kate has 1 message (1 from Alice)

# user2.all_messages.length == 3 # TRUE
# user2.messages_with_user(user1.id).length == 2   # TRUE