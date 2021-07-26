# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:"Admin",email:"admin@flashsale.com",is_admin:true)
User.create(name:"Customer_one",email:"customer_one@flashsale.com",is_admin:false)
User.create(name:"Customer_two",email:"customer_two@flashsale.com",is_admin:false)
User.create(name:"Customer_three",email:"customer_three@flashsale.com",is_admin:false)
User.create(name:"Customer_four",email:"customer_four@flashsale.com",is_admin:false)
User.create(name:"Customer_five",email:"customer_five@flashsale.com",is_admin:false)
User.create(name:"Customer_six",email:"customer_six@flashsale.com",is_admin:false)
User.create(name:"Customer_seven",email:"customer_seven@flashsale.com",is_admin:false)
User.create(name:"Customer_eight",email:"customer_eight@flashsale.com",is_admin:false)