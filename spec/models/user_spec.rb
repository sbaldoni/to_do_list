require "rails_helper"

## note that due to the way we included this in our gemfile
#  namely 'require: false', means that we must explicitly include
#  it here
require 'shoulda/matchers'

describe User do

    ## we can remove the two methods that check for nil attributes,
    #  our validators will handle this now
    #  if we weren't removing them, we could move the user declaration
    #  outside the it blocks so we only do it once

    #user = FactoryGirl.build_stubbed(:a_user)

    ## we are going to remove our first two tests because they are redundant
    #it "has an email" do
    #
    #   expect(user.email).to_not be_nil
    #end

    #it "has a password" do
    #
    #  expect(user.password).to_not be_nil
    #end


    it { should validate_uniqueness_of(:email) }

    ## validate that a string like 'a@a.com' is 
    #  accepted as an email
    it do
      should allow_value('a@a.com').
                 for(:email)
    end

    ## this one is slightly tricky becuase there
    #  isn't a not_allow_value matcher,
    #  so we need to use !
    #  this verifies that 'bob' is not accepted
    #  as a vaild email
    it do
      should !allow_value('bob').
                 for(:email)
    end

    #test both min and max validation attributes are present
    it { should ensure_length_of(:password).is_at_least(6) }

    it { should ensure_length_of(:password).is_at_most(20)}

    it { should ensure_length_of(:email).is_at_most(255)}

end