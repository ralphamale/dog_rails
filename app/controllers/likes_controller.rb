class LikesController < ApplicationController
	before_action :find_dog


	def create
		#Must be logged in, must not be from current user

		if current_user && @dog.owner != current_user
			@current_user.likes.find_or_create_by(:dog => @dog)
			redirect_to dog_path(@dog), notice: "You have liked #{@dog.name}"
		end
	end

	private

	def find_dog
		@dog = Dog.find(params[:dog_id])
	end
end
