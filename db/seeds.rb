# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hm = User.new
hm.email = 'hm@school.com'
hm.password = 'password-1'
hm.password_confirmation = 'password-1'
hm.role = 2
hm.name = 'John'
hm.phone = '9876543121'
hm.gender = 'M'
hm.save!

teacher = User.new
teacher.email = 'teacher@school.com'
teacher.password = 'teacher-1'
teacher.password_confirmation = 'teacher-1'
teacher.role = 1
teacher.name = 'Peter'
teacher.phone = '978776544'
teacher.gender = 'M'
teacher.save