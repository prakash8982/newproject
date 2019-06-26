class HomeController < ApplicationController
	def index
    if current_user.phase1 == true
           redirect_to check_phase1_path

    elsif current_user.phase2 == true
        redirect_to check_phase2_path



    elsif current_user.phase3 == true
         redirect_to check_phase3_path

      
    else
      @pstaff = current_user.pstaffs
      if @pstaff.ids.count == 0  

      else
        redirect_to pstaffs_path
      end
    end
	end


	def about
    end


   def contact
   end

   def home1
   	
   end
end
