require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController do
  fixtures :all
  integrate_views
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when authentication is invalid" do
    post :create, :user_session => { :username => "foo", :password => "badpassword" }
    response.should render_template(:new)
    UserSession.find.should be_nil
  end
  
  it "create action should redirect when authentication is valid" do
    post :create, :user_session => { :username => "foo", :password => "secret" }
    response.should redirect_to(root_url)
    UserSession.find.user.should == users(:foo)
  end
end
