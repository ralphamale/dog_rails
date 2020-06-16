require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	context 'User is not owner' do
		context 'without an existing Like' do


		end

		context 'with an existing like' do
			it 'does not persist another one' do

			end

		end
	end

	context 'User is owner' do
		it 'does not allow voting' do

		end
	end
end
