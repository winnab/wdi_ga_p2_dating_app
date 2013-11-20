require "spec_helper"

  describe UsersController do

    # ***** GET SHOW 1 : NOT YET********** #
    describe "GET show" do
      before do
        @fake_user = User.create(first_name: "Bob", last_name:"Tester", username: "Bobbob", email: "bob@bob.com", password: "bob12345", confirmed_at: DateTime.now)
        current_user = @fake_user
      end

      it "assigns @user" do
        get :show, {id: @fake_user.id}
        expect(assigns[:user]).to eq(@fake_user)
      end
    end
    # ***** GET SHOW 1 PASSED UNTIL DEVISE GOT IN THE WAY - SEE DEVISE WITH FACTORY GIRL ***** #

    # GET INDEX 1 : #
    describe "GET index" do
     it "should respond with a 200 status" do
        get :index
        expect(response.status).to eq(200)
      end
    end
    # ***** GET INDEX 1 PASSES **** #

    # ***** DO SEARCH ***** (NOT FINISHED - DO I NEED CAPYBARA FOR THIS - OR TO CREATE A CUSTOM HELPER METHOD/ SOMETHING COMPLICATED?)#
    # describe "#do_search" do
    #   before do
    #     @fake_user_1 = User.create(first_name: "Bob", last_name:"Tester", username: "Bobbob", email: "bob@bob.com", password: "bob12345", confirmed_at: DateTime.now)
    #   end

    #   it "should return searched-for user" do

    #   end

    #   it "should not return searched-for user"

    #   end
    # ***** DO SEARCH ***** #

end