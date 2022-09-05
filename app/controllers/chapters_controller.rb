class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[ show edit update destroy ]

  def index
    @chapters = Section.all
  end

  def show
  end

  def new
    @chapter = Chapter.new
  end

  def edit
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to chapter_url(@chapter), notice: "Chapter was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to chapter_url(@chapter), notice: "Chapter was successfully updated." }
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
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:name, :description, :type, :body, :user_id)
    end
end
