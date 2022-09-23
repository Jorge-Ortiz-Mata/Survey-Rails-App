class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chapter, only: %i[ show edit update destroy ]

  def index
    @chapters = current_user.sections.grab_all_chapters
  end

  def show
  end

  def new
    @chapter = Section.new
  end

  def edit
  end

  def body
    @chapter = Section.find(params[:chapter_id])
  end

  def create
    @chapter = current_user.sections.build(chapter_params)
    @chapter.section_type = 2

    respond_to do |format|
      if @chapter.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('chapters_all',
                                                  partial: 'chapters/chapters',
                                                  locals: { chapters: Section.grab_all_chapters }) }

      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal',
                                                  partial: 'errors/new_chapter',
                                                  locals: {}) }
      end
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("section_#{@chapter.id}",
                                                  partial: 'chapters/card_chapter',
                                                  locals: { chapter: @chapter }) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to chapters_url, notice: "Chapter was successfully destroyed." }
    end
  end

  private
    def set_chapter
      @chapter = Section.find(params[:id])
    end

    def chapter_params
      params.require(:section).permit(:name, :description, :body)
    end
end
