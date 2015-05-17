class UsersController < ApplicationController
	def index 
		@user	=	User.all
	end

	def	show
			@user	=	User.find(params[:id])
	end
  
	def	new
		@user = User.new
	end	

	def	create
			@user	=	User.new(user_params)				#	Not	the	final	implementation!
			if	@user.save
          sign_in @user
					flash[:success]	=	"Welcome	to	the	Sample	App!"
					redirect_to	@user
			else
				flash[:error]	=	"failed!"
				render	'new'
			end
	end	

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #
    else
      flash[:success] = "no valid form!"
      render 'edit'
    end
  end

	private

		def	user_params
			params.require(:user).permit(:name,	:email,	:password, :password_confirmation)
		end	
end
