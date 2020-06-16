require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'associations' do
  	it {should belong_to(:owner).class_name('User').optional }
  end
end