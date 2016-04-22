class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    if user_authorized
      @teacher = Teacher.new
      @teacher.build_user
    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  def edit
  end

  def create
    if user_authorized
      @teacher = Teacher.new(teacher_params)

      respond_to do |format|
        if @teacher.save
          format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        else
          format.html { render :new }
        end
      end

    else
      redirect_to root_path, notice: "You aren't allowed to do that"
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :course, user_attributes: [:id, :email, :password, :password_confirmation, :teacher_id])
    end
end
