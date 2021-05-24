class MeetingMailer < ApplicationMailer
	helper :application

    default from: "interviews3196@gmail.com"

    def meeting_scheduled
    	puts "in meeting_scheduled"
    	@meeting = params[:meeting]
    	@user = params[:user]

    	mail(to: @user.email, subject: "New Session Confirmation")
    end
end
