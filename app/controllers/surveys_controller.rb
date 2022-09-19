class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy add_emails send_survey_by_email]

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def add_emails
  end

  def create
    @survey = current_user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('surveys_all',
                                                  partial: 'surveys/surveys',
                                                  locals: { surveys: Survey.all }) }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("survey_#{@survey.id}",
                                                  partial: 'surveys/card_survey',
                                                  locals: { survey: @survey }) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully destroyed." }
    end
  end

  def send_survey_by_email
    send_survey_params
    @log = Log.new(email: @email, status: 0, survey_id: @survey.id)
    @log.save

    SurveyMailer.with(log: @log, subject: @subject,
                      message: @message, survey: @survey).welcome_survey.deliver_later
  end

  private
    def set_survey
      @survey = Survey.find(params[:id] || params[:survey_id])
    end

    def survey_params
      params.require(:survey).permit(:name, :description, :avatar)
    end

    def send_survey_params
      @email = params[:email]
      @subject = params[:subject]
      @message = params[:message]
    end
end
