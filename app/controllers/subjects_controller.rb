class SubjectsController < ApplicationController
  before_filter :check_teacher_privileges!
  
  def index
    @subject = Subject.all
  end
  
  def new
    @subject = Subject.new
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path
    else
      render 'new'
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
 
    if @subject.update(subject_params)
      redirect_to subjects_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
 
    redirect_to subjects_path
  end
  
private
  def subject_params
    params.require(:subject).permit(:sname)
  end

end
