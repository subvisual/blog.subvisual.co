require 'spec_helper'

describe User do
  context '.from_full_name' do
    it 'finds a user from an exact name' do
      first_name, last_name = %w(Miguel Palhas)
      user = create(:user, first_name: first_name, last_name: last_name)
      search_name = "#{first_name} #{last_name}"

      found_user = User.from_full_name(search_name)

      expect(found_user).to eq user
    end

    it 'finds a user from a lower cased name' do
      first_name, last_name = %w(Miguel Palhas)
      user = create(:user, first_name: first_name, last_name: last_name)
      search_name = "#{first_name} #{last_name}".downcase

      found_user = User.from_full_name(search_name)

      expect(found_user).to eq user
    end

    it 'finds nothing if the name is wrong' do
      first_name, last_name = %w(Miguel Palhas)
      create(:user, first_name: first_name, last_name: last_name)

      found_user = User.from_full_name('something else')

      expect(found_user).to be_nil
    end
  end
end
