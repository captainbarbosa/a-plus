class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  def send_report
    @student = Student.find(params[:student_id])
    GradeMailer.create_report(@student).deliver
    redirect_to students_path, notice: "Report generated"
  end

  def index
    @students = Student.all
  end

  def show
    @parents = Parent.where(student_id: @student.id)
    @grades = Grade.where(student_id: @student.id)
  end

  def new
    @student = Student.new
    @student.build_user
  end

  def create
    if user_authorized
      @student = Student.new(student_params)

      respond_to do |format|
        if @student.save
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
        else
          format.html { render :new }
        end
      end
    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :teacher_id, user_attributes: [:id, :email, :password, :password_confirmation, :student_id] )
    end
end
