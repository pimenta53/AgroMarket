class ContactController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	@contact.save

  	head :ok
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :text)
    end
end
