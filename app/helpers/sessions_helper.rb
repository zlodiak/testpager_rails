module	SessionsHelper
	def	sign_in(user)
		remember_token	=	User.new_remember_token
		cookies.permanent[:remember_token]	=	remember_token
		user.update_attribute(:remember_token,	User.encrypt(remember_token))
		self.current_user	=	user
	end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token  = User.encrypt(cookies[:remember_token])
    p 333
    p remember_token
    p 123
    @current_user ||= User.find_by(remember_token:  remember_token)
    if @current_user
      print 'Variable is 10'
    else
      print 'Variable is something else'
    end
    p 123
  end  

  def signed_in?
    !current_user.nil?
  end  
end