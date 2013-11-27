require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Academy::WorkshopsController do

  # This should return the minimal set of attributes required to create a valid
  # Academy::Workshop. As you add validations to Academy::Workshop, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Academy::WorkshopsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all academy_workshops as @academy_workshops" do
      workshop = Academy::Workshop.create! valid_attributes
      get :index, {}, valid_session
      assigns(:academy_workshops).should eq([workshop])
    end
  end

  describe "GET show" do
    it "assigns the requested academy_workshop as @academy_workshop" do
      workshop = Academy::Workshop.create! valid_attributes
      get :show, {:id => workshop.to_param}, valid_session
      assigns(:academy_workshop).should eq(workshop)
    end
  end

  describe "GET new" do
    it "assigns a new academy_workshop as @academy_workshop" do
      get :new, {}, valid_session
      assigns(:academy_workshop).should be_a_new(Academy::Workshop)
    end
  end

  describe "GET edit" do
    it "assigns the requested academy_workshop as @academy_workshop" do
      workshop = Academy::Workshop.create! valid_attributes
      get :edit, {:id => workshop.to_param}, valid_session
      assigns(:academy_workshop).should eq(workshop)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Academy::Workshop" do
        expect {
          post :create, {:academy_workshop => valid_attributes}, valid_session
        }.to change(Academy::Workshop, :count).by(1)
      end

      it "assigns a newly created academy_workshop as @academy_workshop" do
        post :create, {:academy_workshop => valid_attributes}, valid_session
        assigns(:academy_workshop).should be_a(Academy::Workshop)
        assigns(:academy_workshop).should be_persisted
      end

      it "redirects to the created academy_workshop" do
        post :create, {:academy_workshop => valid_attributes}, valid_session
        response.should redirect_to(Academy::Workshop.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved academy_workshop as @academy_workshop" do
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Workshop.any_instance.stub(:save).and_return(false)
        post :create, {:academy_workshop => { "user_id" => "invalid value" }}, valid_session
        assigns(:academy_workshop).should be_a_new(Academy::Workshop)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Workshop.any_instance.stub(:save).and_return(false)
        post :create, {:academy_workshop => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested academy_workshop" do
        workshop = Academy::Workshop.create! valid_attributes
        # Assuming there are no other academy_workshops in the database, this
        # specifies that the Academy::Workshop created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Academy::Workshop.any_instance.should_receive(:update).with({ "user_id" => "1" })
        put :update, {:id => workshop.to_param, :academy_workshop => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested academy_workshop as @academy_workshop" do
        workshop = Academy::Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :academy_workshop => valid_attributes}, valid_session
        assigns(:academy_workshop).should eq(workshop)
      end

      it "redirects to the academy_workshop" do
        workshop = Academy::Workshop.create! valid_attributes
        put :update, {:id => workshop.to_param, :academy_workshop => valid_attributes}, valid_session
        response.should redirect_to(workshop)
      end
    end

    describe "with invalid params" do
      it "assigns the academy_workshop as @academy_workshop" do
        workshop = Academy::Workshop.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Workshop.any_instance.stub(:save).and_return(false)
        put :update, {:id => workshop.to_param, :academy_workshop => { "user_id" => "invalid value" }}, valid_session
        assigns(:academy_workshop).should eq(workshop)
      end

      it "re-renders the 'edit' template" do
        workshop = Academy::Workshop.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Workshop.any_instance.stub(:save).and_return(false)
        put :update, {:id => workshop.to_param, :academy_workshop => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested academy_workshop" do
      workshop = Academy::Workshop.create! valid_attributes
      expect {
        delete :destroy, {:id => workshop.to_param}, valid_session
      }.to change(Academy::Workshop, :count).by(-1)
    end

    it "redirects to the academy_workshops list" do
      workshop = Academy::Workshop.create! valid_attributes
      delete :destroy, {:id => workshop.to_param}, valid_session
      response.should redirect_to(academy_workshops_url)
    end
  end

end
