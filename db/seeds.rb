# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Message.destroy_all

user1 = User.create(first_name: "Bob", last_name:"Tester", username: "Bobbob", email: "bob@bob.com", age: 22, gender: "Male", location: "London", plan: "standard", password: "bob12345", confirmed_at: DateTime.now)
user2 = User.create(first_name: "Alice", last_name:"Tester", username: "Alice1986", email: "alice@alice.com", age: 20, gender: "Female", location: "Oxford", plan: "premium", password: "alice12345", confirmed_at: DateTime.now)
user3 = User.create(first_name: "Kate", last_name:"Tester", username:"CrazyKate", email: "kate@kate.com", age: 21, gender: "Female", location: "London", plan: "standard", password: "kate12345", confirmed_at: DateTime.now)

# user1.plan = "standard"
# user2.plan = "premium"
# user3.plan = "premium"
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

# Event tests

# Bob stars Alice
event = Event.create(user_id: user1.id, target_user_id: user2.id, event_type: 'star', created_at: DateTime.now)
# Alice pokes Bob
event2 = Event.create(user_id: user2.id, target_user_id: user1.id, event_type: 'poke', created_at: DateTime.now)
