require File.dirname(__FILE__) + '/../spec_helper'
 
describe InfosController do
  fixtures :all
  integrate_views
  
  before :each do
    controller.stubs(:login_required).returns(true)
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Info.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Info.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Info.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(info_url(assigns[:info]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Info.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Info.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Info.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Info.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Info.first
    response.should redirect_to(info_url(assigns[:info]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    info = Info.first
    delete :destroy, :id => info
    response.should redirect_to(infos_url)
    Info.exists?(info.id).should be_false
  end
end
