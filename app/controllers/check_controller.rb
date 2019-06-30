class CheckController < ApplicationController
  skip_before_action :verify_authenticity_token,:only =>[:sticker,:remark]
  before_action :authenticate_user!,expect: [:show,:index]
	def phase1
        if current_user.phase1 == true
            @phases= Pstaff.all
        else
            redirect_to new_user_session_path
        end

  end

  def phase2
      if current_user.phase2 == true
            @phases= Pstaff.all
      else
            redirect_to new_user_session_path
      end
  end

    def phase3
        if current_user.phase3 == true
            @phases= Pstaff.all
        else
            redirect_to new_user_session_path
        end
    end

    def admin
      @phases= Pstaff.all
    end

    def remark
        @current_user = current_user
        @remark=Pstaff.find(params[:id])
        if params[:commit]=='Submit'
            if current_user.phase1 == true
                x=Pstaff.find(@remark.id)
                x.phase1=true
                x.phase1_remark=pstaff_params[:phase1_remark]
                

                @user = User.all
                for i in @user do
                  if(i.role == x.department)
                    @id = i
                    break 
                  end
                end
                x.save

                NotifyMailer.with(user: @id).recive_email.deliver
        

                #@p = User.find(z)
                # NotificationMailer.with(user:@p).approve_email.deliver
                flash[:notice] = "approved succesfully!"
                redirect_to check_phase1_path
            elsif current_user.phase2 == true
                user=Pstaff.find(@remark.id)
                user.phase2_remark=pstaff_params[:phase2_remark]
                user.phase2=true
                @user = User.all
                for i in @user do
                  if(i.role == user.department)
                    @id = i
                    break 
                  end
                end
                user.save
                NotifyMailer.with(user: @id).recive_email.deliver
                
                flash[:notice] = "approved succesfully!"
                redirect_to check_phase2_path
    
            elsif current_user.phase3 == true
                @user=Pstaff.find(@remark.id)
                @user.disapprove=true
                @user.phase3_remark=pstaff_params[:phase2_remark]
                z = @user.user_id
                @p = User.find(z)
                @user.save
                NotificationMailer.with(user:@p).disapprove_email.deliver
                flash[:notice] = "disapproved succesfully!"
                redirect_to check_phase3_path()
            else
        end
   
            
        end
    end


    def sticker
         #@user =current_user
         @sticker=Pstaff.find(params[:id])

         if params[:commit]=='Submit'

             if current_user.phase1 == true

             x=Pstaff.find(@sticker.id)
             x.phase1=true
             
             x.save
             #@p = User.find(z)
             #NotificationMailer.with(user:@p).approve_email.deliver
             redirect_to check_phase1_path

         elsif current_user.phase2 == true
             user=Pstaff.find(@sticker.id)
             user.phase2=true
             user.save
             flash[:notice] = "approved succesfully!"
             redirect_to check_phase2_path

         elsif current_user.phase3 == true
             @user=Pstaff.find(@sticker.id)
             @user.phase3=true
             @user.sticker=pstaff_params[:sticker]
             @user.save
             z = @user.user_id
             @p = User.find(z)
             NotificationMailer.with(user:@p).disapprove_email.deliver
             flash[:notice] = "approved succesfully!"
             redirect_to check_phase3_path
         end
         end
    end

   def show_user_form
       @pstaff=Pstaff.find(params[:id])
        #redirect_to pstaff_path(@pstaff)
   end
    
    def approve
    if current_user.phase1 == true
    
    	x=Pstaff.find(params[:id])
        x.phase1=true
        z = x.user_id
        x.save
        @p = User.find(z)
        # NotificationMailer.with(user:@p).approve_email.deliver
         flash[:notice] = "approved succesfully!"
         redirect_to check_phase1_path
    
    elsif current_user.phase2 == true
    	user=Pstaff.find(params[:id])
        user.phase2=true
        user.save
        flash[:notice] = "approved succesfully!"
        redirect_to check_phase2_path
    
    elsif current_user.phase3 == true
    
    	@user=Pstaff.find(params[:id])
        @user.phase3=true
        @user.save
        flash[:notice] = "approved succesfully!"
        redirect_to check_phase3_path()
    else
    end
    end


    def search

    if params[:search].blank?  
    redirect_to(check_phase3_path, alert: "Empty field!") and return  
    else  
    @parameter = params[:search]
    @result= Pstaff.all.where(:vichel_no => @parameter)
    
    end  
    end

    def new
    end

    def create
        
        query = params[:sticker] 
        user=Pstaff.find(params[42])
        user.sticker = query
        user.save
        redirect_to check_phase3_path
        
    end

    def disapprove

        if current_user.phase1 == true
        
        x=Pstaff.find(params[:id])
        x.disapprove= true
        z = x.user_id
        x.save
        @p = User.find(z)
         NotificationMailer.with(user:@p).disapprove_email.deliver
        flash[:notice] = "application disapprove succesfully"

        redirect_to check_phase1_path
    elsif current_user.phase2 == true
        user=Pstaff.find(params[:id])
        user.disapprove = true
        z = user.user_id
        user.save
        @p = User.find(z)
         NotificationMailer.with(user:@p).disapprove_email.deliver
        flash[:notice] = "application disapprove succesfully"

        redirect_to check_phase2_path
    elsif current_user.phase3 == true

        @user=Pstaff.find(params[:id])

        @user.disapprove =true
        @user.save
        flash[:notice] = "application disapprove succesfully"
        redirect_to check_phase3_path
    else
    end
        
    end
    

    def pstaff_params
        params.require(:pstaff).permit(:sticker,:name,:phase1_remark,:phase2_remark,:phase3_remark)
    end




end
