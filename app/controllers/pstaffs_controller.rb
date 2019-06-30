class PstaffsController < ApplicationController
 before_action :set_pstaff, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,expect: [:index]
  # GET /pstaffs
  # GET /pstaffs.json
  def index
    if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaffs = current_user.pstaffs
    else
      redirect_to  new_user_session_path
    end
  end

  # GET /pstaffs/1
  # GET /pstaffs/1.json
  def show
    @pstaffs = Pstaff.find(params[:id])
    
    if current_user.id != @pstaffs.user_id 
      flash[:notice] = "You don't have access to that order!"
      redirect_to pstaffs_path(session[:current_user])
    return
    end
  end
  #for user
  def showuser
    if(current_user)
        @pstaff = Pstaff.find(params[:id])
    end
    
  end
  # GET /pstaffs/new
  

  def new
    if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
             @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
  end

  # GET /pstaffs/1/edit
  def edit
    if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
     # @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
  end

  def tstaff_new
    if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
    
  end

  def phdstaff_new
     if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
    
  end

  def vender_new
    if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
    
  end

  def others_new
     if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaff = current_user.pstaffs.build
    else
       redirect_to new_user_session_path
    end
    
  end

  # POST /pstaffs
  # POST /pstaffs.json
  def create
    @pstaff = current_user.pstaffs.build(pstaff_params)

    respond_to do |format|
      if @pstaff.save
        format.html { redirect_to @pstaff, notice: 'Pstaff was successfully created.' }
        format.json { render :user, status: :created, location: @pstaff }
      else
        format.html { render :new }
        format.json { render json: @pstaff.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /pstaffs/1
  # PATCH/PUT /pstaffs/1.json
  def update
    
    respond_to do |format|
      if @pstaff.update(pstaff_params)

        @user = User.all
        for i in @user do
          if(i.phase1 == true)
            @id = i
            break 
          end
      end
            
      NotifyMailer.with(user: @id).recive_email.deliver
        #send email from here
        format.html { redirect_to @pstaff, notice: 'Pstaff was successfully updated.' }
        format.json { render :show, status: :ok, location: @pstaff }
      else
        format.html { render :edit }
        format.json { render json: @pstaff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pstaffs/1
  # DELETE /pstaffs/1.json
  def destroy
    @pstaff.destroy
    respond_to do |format|
      format.html { redirect_to pstaffs_url, notice: 'Pstaff was successfully destroyed.' }
      format.json { head :no_content }
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pstaff
      # if(current_user.phase1 == false &&  current_user.phase2 == false && current_user.phase3 == false)
      @pstaff = Pstaff.find(params[:id])
    # else
    #    redirect_to new_user_session_path
    # end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pstaff_params
      params.require(:pstaff).permit(:name, :gender, :unique_id, :vichel_no, :vichel_model, :vehical_type, :mobile_no, :department, :address, :registration_certificate, :aadhaar_card, :type_applicant, :RC_holder_name, :relationship)
    end
end
