class ResultsController < ApplicationController
  before_filter :check_student_privileges!, except: :student_login
  before_filter :check_teacher_privileges!, only: :new
  before_filter :check_hm_privileges!, only: [:headmaster_login, :student_addmission, :student_edit]
  
  def new
    @result = Result.new
    @subjects = Subject.all
    @users = User.where(:role => 0)
  end
  
  def create
    @result = Result.new(subject_params)
    if @result.save
      redirect_to new_result_path
    else
      render 'new'
    end
  end
  
  def index
    @result = Result.all
  end
  
  def home
    if current_user != nil
      if current_user.role == 'student'
        redirect_to student_login_results_path
      elsif current_user.role == 'teacher'
        redirect_to teacher_login_results_path
      else
        redirect_to headmaster_login_results_path
      end
    end
  end
  
  def student_login
    @result = current_user.results
    #@result = Result.where(:user_id => current_user[:rollnumber])
  end
  
  def teacher_login
    
  end
  
  def headmaster_login
    @students = User.where(:role => 0)
    @number_of_students = @students.count
  end
  
  def student_addmission
    @student = User.new
  end
  
  def student_edit
    @student = User.find(params[:id])
  end
  
  def student_create
    @student = User.new(params.require(:student).permit(:id, :email, :rollnumber, :password, 
                                                        :password_confirmation, :name, :phone, :gender))
    @student.save
    redirect_to headmaster_login_results_path
  end
  
  def student_update
    @student = User.find(params[:id])
 
    if @student.update(params.require(:student).permit(:id, :email, :rollnumber, :password, 
                                                        :password_confirmation, :name, :phone, :gender))
      redirect_to headmaster_login_results_path
    else
      render 'student_edit'
    end
  end
  
  private
    def subject_params
      params.require(:result).permit(:user_id, :sname, :marks)
    end
end
