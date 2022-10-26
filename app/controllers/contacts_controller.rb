class ContactsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def list
        p '------contct cntrlr list-------'
       
        if params[:page_size].blank?
            params[:page_size]=5
        end
       if params['search_name'].blank?
        @contacts=current_user.contacts.all.paginate(page:params[:page], :per_page =>params[:page_size] )  
       else    
        @contacts=current_user.contacts.search(params['search_name']).paginate(page:params[:page])
      
        if @contacts.blank?
            puts '--------------nothing to show------------'
        end
        respond_to do |format|
            format.html
            format.pdf do
              render pdf: "Contacts: #(current_user.contacts.all.count)", template: "contacts/list.html.erb"   # Excluding ".pdf" extension.
            end
          end
        
    end

    def show  
        p '--------contct cntrler show-----------'

        @contact=Contact.find(params[:id])  
        p @contact
        respond_to do |format|
            format.html
            format.pdf do
              render pdf: "Contact id: #(@contact.id)", template: "contacts/pdf_page.html.erb"   # Excluding ".pdf" extension.
            end
          end
       end  
        
    end

    def contact_params
        params.require(:contacts).permit(:firstName,:lastName,:address,:city,:phone,:email,:user_id)    
    end 

    def new
        @contact= Contact.new
    end

    def create
        @contact= current_user.contacts.build(contact_param)   
        respond_to do |format|
            if @contact.save
                format.html {redirect_to contacts_new_url(@contact),notice: "A contact is successfully created."}
                format.json {render :show, status: :created, location: @contact}
             else       
                format.html{ render :new, status: :unprocessable_entity}
                format.json{ render json: @contact.errors, status: :unprocessable_entity}
            end   
        end   
    end
    
    def contact_param
        params.require(:contact).permit(:firstName,:lastName,:address,:city,:phone,:email,:dp,:user_id,:favourite)
    end

    def edit
        @contact= Contact.find(params[:id])
    end
    
    def update
        @contact= Contact.find(params[:id]) 
        if @contact.update(contact_param)
            redirect_to :action => 'show', :id =>@contact
        else
            render :action => 'edit' 
        end       
    end
     
    def delete
        Contact.find(params[:id]).destroy
        respond_to do |format|
            format.html { redirect_to contacts_list_path, alert: 'A contact is sucessfully destroyed!'}
            format.json { head :no_content}
        end     
    end

    def send_email
        p '------send_email------'
        p params[:message]
        p params[:email]
        ContactMailer.contact(params[:message],params[:email],params[:sub]).deliver
       
    end
    
end
