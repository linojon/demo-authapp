module UserHelpers
  def create_user( options = {} )
    args = {
      :username => 'subscriber',
      :password => 'secret',
      :password_confirmation => 'secret',
    }.merge( options )
    args[:email] ||= "#{args[:username]}@example.com"
    user = User.create!(args)
    # :create syntax for restful_authentication w/ aasm. Tweak as needed.
    # user.activate! 
    user
  end

  def log_in_as( username )
    visit "/login" 
    fill_in("user_session_username", :with => username) 
    fill_in("password", :with => 'secret') 
    click_button("Log in")  
  end  
  
end

World(UserHelpers)