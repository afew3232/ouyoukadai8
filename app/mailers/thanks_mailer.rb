class ThanksMailer < ApplicationMailer
	def welcome_email_action
		@user = User.find(params[:user_id])
		@url = "localhost:3000"
		mail(to:@user.email, subject:"ようこそ")
		#subjectはタイトル
	end
end
