class NotificationMailer < ApplicationMailer
	default from: 'sharmaprakash7415@gmail.com'

	def approve_email
		@user = params[:user]
		mail(to: @user.email, subject: "your application is approved succesfully")
	end


	def disapprove_email
		@user = params[:user]
		mail(to: @user.email, subject: "your application is disapprove please fill the form again")
	end
end
