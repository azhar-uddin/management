class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

    protected

    def configure_devise_permitted_parameters
      registration_params = [:email, :password, :password_confirmation, :name, :phone, :gender, :rollnumber]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end
    
    def after_sign_in_path_for(resource)
      if current_user.role == 'student'
        student_login_results_path
      elsif current_user.role == 'teacher'
        teacher_login_results_path
      else
        headmaster_login_results_path
      end
    end
    
    def check_student_privileges!
      if current_user
        redirect_to student_login_results_path, notice: 'You dont have enough permissions to be here' unless current_user.role == 'teacher' || current_user.role == 'head_master'
      end
    end
    
    def check_teacher_privileges!
      if current_user
        redirect_to headmaster_login_results_path, notice: 'Only Teacher can add Marks' unless current_user.role == 'teacher'
      end
    end
    
    def check_hm_privileges!
      if current_user
        redirect_to student_login_results_path, notice: 'You dont have enough permissions to be here' if current_user.role == 'student'
        redirect_to teacher_login_results_path, notice: 'You dont have enough permissions to be here' if current_user.role == 'teacher'
      end
    end
    
end
