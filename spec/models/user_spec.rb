
require "spec_helper"

# ***** DISPLAY STARRED USERS PASSES ***** #
  describe User do

    describe "starred users" do
      before do
        @fake_user_1 = User.create(first_name: "Bob", last_name:"Tester", username: "Bobbob", email: "bob@bob.com", password: "bob12345", confirmed_at: DateTime.now)
        @fake_user_2 = User.create(first_name: "Alice", last_name:"Tester", username: "Alice1986", email: "alice@alice.com", password: "alice12345", confirmed_at: DateTime.now)
        @fake_event = Event.create(user_id: @fake_user_1.id, target_user_id: @fake_user_2.id, event_type: 'star', created_at: DateTime.now)
      end

      describe "starred users" do
        it "should display starred users" do
          expect(@fake_user_1.get_starred_users.first.id).to eq(@fake_user_2.id)
        end
      end
    end
  end
# ***** DISPLAY STARRED USERS PASSES ***** #
