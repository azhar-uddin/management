class Result < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :sname
  validates_numericality_of :marks, :only_integer => true
end
