require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe '#edit' do
    context 'when authorized'
    context 'when unauthorized'

  end


  describe '#edit' do
    context 'unauthorized' do
    end

    context 'authorized' do
    end
    
  end
  describe '#index' do
    it 'shows pagination' do
        6.times { create(:dog) }
        get :index
        expect(assigns(:dogs).size).to eq(5)
    end
  	context 'Default sort' do
      #shows first created dog first.
	    it 'displays oldest dogs first' do
	      6.times { create(:dog) }
	      get :index
	      expect(assigns(:dogs).size).to eq(5)
	    end
  	end

  	context 'Trendy sort' do
  		it 'sorts by likes only in last hour' do

  		end

  		it 'does not count older likes' do

  		end

      it 'counts dogs with zero likes if necessary' do

      end
  	end
  end
end
