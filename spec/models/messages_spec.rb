require "spec_helper"

describe Message do

  describe "create message" do
      before do
        @fake_user_1 = User.create(first_name: "Bob", last_name:"Tester", username: "Bobbob", email: "bob@bob.com", password: "bob12345", confirmed_at: DateTime.now)
        @fake_user_2 = User.create(first_name: "Alice", last_name:"Tester", username: "Alice1986", email: "alice@alice.com", password: "alice12345", confirmed_at: DateTime.now)
        @fake_message = Message.create(sender_id: @fake_user_1.id, recipient_id: @fake_user_2.id, content: "Hello Alice, from Bob")
      end

    it "should create a message" do
      @fake_message.content.should include("Hello")
    end

    it "should send a message from user 1" do
      @fake_message.sender_id.should eq(1)
    end

    it "should be addressed to user 2" do
      @fake_message.recipient_id.should eq(2)
    end

  end

end # end for 'Describe Message'

