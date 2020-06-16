class LikesController < ApplicationController
  before_action :authenticate_user!, :find_dog, :block_self_promotion, :only => [:create]

	def create
		@current_user.likes.find_or_create_by(:dog => @dog)
		redirect_to dog_path(@dog), notice: "You have liked #{@dog.name}"
	end

	private

	def find_dog
		@dog = Dog.find(params[:dog_id])
	end

	def block_self_promotion
		if @dog.owner?(current_user)
	      redirect_to dog_path(@dog), alert: "Take a paws and like a dog that is not your own!" 
	    end
	end
end
