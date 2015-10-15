require 'spec_helper'

RSpec.describe User do
  context '#name' do
    it 'strips leading or trailing whitespace' do
      user = build(:user, first_name: ' first', last_name: 'last ')

      user.name.should eq 'first last'
    end
  end
end
