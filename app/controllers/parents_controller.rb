class ParentsController < ApplicationController
  before_action :set_parent, only: [:show]

  def index
    @parents = Parent.all
  end

  def show
  end

  def new
    @parent = Parent.new
    @parent.build_user
  end

  def create
    if user_authorized
      @parent = Parent.new(parent_params)

      respond_to do |format|
        if @parent.save
          format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
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
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:name, :student_id, user_attributes: [:id, :email, :password, :password_confirmation, :parent_id])
    end
end
