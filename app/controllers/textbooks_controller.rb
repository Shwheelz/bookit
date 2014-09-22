class TextbooksController < ApplicationController
	before_action :signed_in_user

	def new
		@textbook = Textbook.new
	end

	def create
		@textbook = current_user.textbooks.build(textbook_params)
		if @textbook.save
			flash[:success] = "Textbook added!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end



	private



	def textbook_params
    	params.require(:textbook).permit(:title, :author, :course, 
                                 :isbn, :version, :price)
	end


	def correct_user
		@textbook = current_user.textbooks.find_by(id: params[:id])
		redirect_to root_url if @textbook.nil?
	end
end