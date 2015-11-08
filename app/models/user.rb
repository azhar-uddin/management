class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :results
  accepts_nested_attributes_for :results
  validates_inclusion_of :gender, :in => %w( m f M F)
  validates :rollnumber, uniqueness: true, :allow_blank => true, :allow_nil => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: {"student"=>0, "teacher"=>1, "head_master"=>2}
end
