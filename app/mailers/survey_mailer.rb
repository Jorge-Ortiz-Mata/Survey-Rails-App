class SurveyMailer < ApplicationMailer

  def welcome_survey
    @subject = params[:subject]
    @email = params[:email]
    @message = params[:message]
    @survey = params[:survey]
    @url = "http://localhost:3000/audits/#{@survey.uuid}"
    mail(to: @email, subject: @subject)
  end
end
