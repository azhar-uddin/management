class ResultsController < ApplicationController

  def new
    @result = Result.new
    @subjects = Subject.all
    @users = User.where(:role => 0)
  end
  
  def create
    @result = Result.new(subject_params)
    if @result.save
      notice = 'Result Added'
      redirect_to new_result_path
    else
      render 'new'
    end
  end
  
  def index
    @result = Result.all
  end
  
  def home
    
  end
  
  def student_login
    @result = Result.where(:user_id => current_user[:rollnumber])
  end
  
  def teacher_login
    @result = Result.where(:user_id => current_user[:rollnumber])
  end
  
  def headmaster_login
    @students = User.where(:role => 0)
  end
  
  def student_addmission
    @student = User.new
  end
  
  def student_create
    raise params.inspect
  end
  
  private
    def subject_params
      params.require(:result).permit(:user_id, :sname, :marks)
    end
end
