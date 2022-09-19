class SurveyMailer < ApplicationMailer

  def welcome_survey
    @subject = params[:subject]
    @log = params[:log]
    @message = params[:message]
    @survey = params[:survey]
    @url = "http://localhost:3000/audits/#{@survey.uuid}/#{@log.token}/0"
    mail(to: @log.email, subject: @subject)
  end
end
