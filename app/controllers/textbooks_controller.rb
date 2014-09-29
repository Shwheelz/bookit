class TextbooksController < ApplicationController
	before_action :signed_in_user, :set_textbook, :set_user

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

	def index
		@textbooks = Textbook.search(params[:search]).paginate(page: params[:page])
	end

	def show
		@textbooks = current_user.textbooks
	end

	def update
	    if @textbook.update_attributes(textbook_params)
	      flash[:success] = "Textbook updated"
	      redirect_to root_url
	    else
	      render 'edit'
	    end
  	end

	def edit
  		
  	end

	def destroy
		current_user.textbooks.find_by(id: params[:id]).destroy
		flash[:success] = "Textbook deleted"
		redirect_to root_url
	end



	private

	def set_textbook
		@textbook = current_user.textbooks.find_by(id: params[:id])
	end

	def set_user
		@user = current_user
	end

	def textbook_params
    	params.require(:textbook).permit(:title, :author, :course, 
                                 :isbn, :version, :price)
	end


	def correct_user
		@textbook = current_user.textbooks.find_by(id: params[:id])
		redirect_to root_url if @textbook.nil?
	end
end