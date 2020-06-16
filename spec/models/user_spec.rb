require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
  	it {should have_many(:dogs) }
  	it {should have_many(:likes) } #dependent destroy
  end
end