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

describe Academy::AnswersController do

  # This should return the minimal set of attributes required to create a valid
  # Academy::Answer. As you add validations to Academy::Answer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "question_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Academy::AnswersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all academy_answers as @academy_answers" do
      answer = Academy::Answer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:academy_answers).should eq([answer])
    end
  end

  describe "GET show" do
    it "assigns the requested academy_answer as @academy_answer" do
      answer = Academy::Answer.create! valid_attributes
      get :show, {:id => answer.to_param}, valid_session
      assigns(:academy_answer).should eq(answer)
    end
  end

  describe "GET new" do
    it "assigns a new academy_answer as @academy_answer" do
      get :new, {}, valid_session
      assigns(:academy_answer).should be_a_new(Academy::Answer)
    end
  end

  describe "GET edit" do
    it "assigns the requested academy_answer as @academy_answer" do
      answer = Academy::Answer.create! valid_attributes
      get :edit, {:id => answer.to_param}, valid_session
      assigns(:academy_answer).should eq(answer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Academy::Answer" do
        expect {
          post :create, {:academy_answer => valid_attributes}, valid_session
        }.to change(Academy::Answer, :count).by(1)
      end

      it "assigns a newly created academy_answer as @academy_answer" do
        post :create, {:academy_answer => valid_attributes}, valid_session
        assigns(:academy_answer).should be_a(Academy::Answer)
        assigns(:academy_answer).should be_persisted
      end

      it "redirects to the created academy_answer" do
        post :create, {:academy_answer => valid_attributes}, valid_session
        response.should redirect_to(Academy::Answer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved academy_answer as @academy_answer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Answer.any_instance.stub(:save).and_return(false)
        post :create, {:academy_answer => { "question_id" => "invalid value" }}, valid_session
        assigns(:academy_answer).should be_a_new(Academy::Answer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Answer.any_instance.stub(:save).and_return(false)
        post :create, {:academy_answer => { "question_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested academy_answer" do
        answer = Academy::Answer.create! valid_attributes
        # Assuming there are no other academy_answers in the database, this
        # specifies that the Academy::Answer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Academy::Answer.any_instance.should_receive(:update).with({ "question_id" => "1" })
        put :update, {:id => answer.to_param, :academy_answer => { "question_id" => "1" }}, valid_session
      end

      it "assigns the requested academy_answer as @academy_answer" do
        answer = Academy::Answer.create! valid_attributes
        put :update, {:id => answer.to_param, :academy_answer => valid_attributes}, valid_session
        assigns(:academy_answer).should eq(answer)
      end

      it "redirects to the academy_answer" do
        answer = Academy::Answer.create! valid_attributes
        put :update, {:id => answer.to_param, :academy_answer => valid_attributes}, valid_session
        response.should redirect_to(answer)
      end
    end

    describe "with invalid params" do
      it "assigns the academy_answer as @academy_answer" do
        answer = Academy::Answer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Answer.any_instance.stub(:save).and_return(false)
        put :update, {:id => answer.to_param, :academy_answer => { "question_id" => "invalid value" }}, valid_session
        assigns(:academy_answer).should eq(answer)
      end

      it "re-renders the 'edit' template" do
        answer = Academy::Answer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Academy::Answer.any_instance.stub(:save).and_return(false)
        put :update, {:id => answer.to_param, :academy_answer => { "question_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested academy_answer" do
      answer = Academy::Answer.create! valid_attributes
      expect {
        delete :destroy, {:id => answer.to_param}, valid_session
      }.to change(Academy::Answer, :count).by(-1)
    end

    it "redirects to the academy_answers list" do
      answer = Academy::Answer.create! valid_attributes
      delete :destroy, {:id => answer.to_param}, valid_session
      response.should redirect_to(academy_answers_url)
    end
  end

end
