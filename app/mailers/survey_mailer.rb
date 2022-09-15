class SurveyMailer < ApplicationMailer

  def welcome_survey
    email = params[:email]
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end
end
