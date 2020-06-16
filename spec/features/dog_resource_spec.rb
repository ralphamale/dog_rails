require 'rails_helper'

describe 'Dog resource', type: :feature do
  describe 'Logged in' do
    before do
      @current_user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @current_user.email
      fill_in 'Password', with: @current_user.password
      click_button 'Log in'
    end

    it 'can create a profile' do
      visit new_dog_path
      fill_in 'Name', with: 'Speck'
      fill_in 'Description', with: 'Just a dog'
      attach_file 'Image', 'spec/fixtures/images/speck.jpg'
      click_button 'Create Dog'
      expect(Dog.count).to eq(1)
    end

    describe 'when owner of dog' do
      it 'can edit a dog profile' do
        dog = create(:dog, owner: @current_user)
        visit edit_dog_path(dog)
        fill_in 'Name', with: 'Speck'
        click_button 'Update Dog'
        expect(dog.reload.name).to eq('Speck')
      end

      it 'can delete a dog profile' do
        dog = create(:dog, owner: @current_user)
        visit dog_path(dog)
        click_link "Delete #{dog.name}'s Profile"
        expect(Dog.count).to eq(0)
      end

      it 'can like a dog not their own' do
        other_dog = create(:dog, owner: create(:user, email: "other@user.com"))
        visit dog_path(other_dog)
        click_button 'Like'
        expect(Like.count).to eq(1)

      end
    end

  end
end
