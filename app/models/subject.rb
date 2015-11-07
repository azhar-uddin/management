class Subject < ActiveRecord::Base
  validates :sname, presence: true, uniqueness: true
end
