class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
    @grade.teacher_id = current_user.id
  end

  def edit
  end

  def create
    if user_authorized
      @grade = Grade.new(grade_params)

      respond_to do |format|
        if @grade.save
          format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        else
          format.html { render :new }
        end
      end

    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  def update
    if user_authorized
      respond_to do |format|
        if @grade.update(grade_params)
          format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        else
          format.html { render :edit }
        end
      end

    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  def destroy
    if user_authorized
      @grade.destroy
      respond_to do |format|
        format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      end
    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:assignment_name, :grade, :student_id, :teacher_id)
    end
end
