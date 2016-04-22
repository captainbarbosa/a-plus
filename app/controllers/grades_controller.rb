class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def edit
  end

  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.fetch(:grade, {})
    end
end
