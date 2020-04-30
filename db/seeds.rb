# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# p "destroying perks"
# Perk.destroy_all

# p "Creating Perks"

# perk_list = [
#   {name: "Catering", icon: "fas fa-utensils fa-3x" },
#   {name: "Skill Development", icon: "far fa-star fa-3x" },
#   {name: "Flexible Work Hours", icon: "far fa-clock fa-3x" },
#   {name: "Career Progression", icon: "fab fa-black-tie fa-3x" },
#   {name: "Work life balance", icon: "fas fa-balance-scale fa-3x" },
#   {name: "Health Insurance", icon: "fas fa-heartbeat fa-3x" },
#   {name: "Games & Hangouts", icon: "fas fa-gamepad fa-3x" },
#   {name: "Occasional Remote Work", icon: "fas fa-globe fa-3x" },
#   {name: "Paid Vacation", icon: "fas fa-plane fa-3x" },
#   {name: "Pension Plan", icon: "fas fa-home fa-3x" },
#   {name: "Performance Bonus", icon: "far fa-money-bill-alt fa-3x" },
#   {name: "Free Coffee", icon: "fas fa-coffee fa-3x" },
#   {name: "Parental Leave", icon: "fas fa-baby fa-3x" },
#   {name: "Friday Bars", icon: "fa fa-beer fa-3x" },
#   {name: "Gym Membership", icon: "fas fa-running fa-3x" },
# ]

# Perk.create!(perk_list)

# p "creating Jobs"

# description = Job.find(4).description
# company = Company.find(58)

# job_list = [
#   {title: "Customer Success Consultant", description: description, role: "Customer Service", location: "Copenhagen", job_type: "Full-time", salary: "Paid", company_id: 58 },
#   {title: "Software Engineer", description: description, role: "Software & IT", location: "Tamale", job_type: "Part-time", salary: "Commission", company_id: 58 },
#   {title: "Sales Expert", description: description, role: "Marketing & Sales", location: "Accra", job_type: "Internship", salary: "Unpaid", company_id: 58 },
#   {title: "Project Manager", description: description, role: "Project Management", location: "Kumasi", job_type: "Full-time", salary: "Paid", company_id: 58 },
#   {title: "Agric Officer", description: description, role: "Other", location: "Copenhagen", job_type: "Full-time", salary: "Paid", company_id: 58 }
# ]

# Job.create!(job_list)



# Heroku seeds
# Perk.destroy_all

# p "Creating Perks"

# perk_list = [
#   {name: "Catering", icon: "fas fa-utensils fa-3x" },
#   {name: "Skill Development", icon: "far fa-star fa-3x" },
#   {name: "Flexible Work Hours", icon: "far fa-clock fa-3x" },
#   {name: "Career Progression", icon: "fab fa-black-tie fa-3x" },
#   {name: "Work life balance", icon: "fas fa-balance-scale fa-3x" },
#   {name: "Health Insurance", icon: "fas fa-heartbeat fa-3x" },
#   {name: "Games & Hangouts", icon: "fas fa-gamepad fa-3x" },
#   {name: "Occasional Remote Work", icon: "fas fa-globe fa-3x" },
#   {name: "Paid Vacation", icon: "fas fa-plane fa-3x" },
#   {name: "Pension Plan", icon: "fas fa-home fa-3x" },
#   {name: "Performance Bonus", icon: "far fa-money-bill-alt fa-3x" },
#   {name: "Free Coffee", icon: "fas fa-coffee fa-3x" },
#   {name: "Parental Leave", icon: "fas fa-baby fa-3x" },
#   {name: "Friday Bars", icon: "fa fa-beer fa-3x" },
#   {name: "Gym Membership", icon: "fas fa-running fa-3x" },
# ]

# Perk.create!(perk_list)

# p "Perks created successfully"

p "creating Jobs"

description = Job.find(1).description
company = Company.find(1)

job_list = [
  {title: "Customer Success Consultant", description: description, role: "Customer Service", location: "Copenhagen", job_type: "Full-time", salary: "Paid", company_id: 1 },
  {title: "Software Engineer", description: description, role: "Software & IT", location: "Tamale", job_type: "Part-time", salary: "Commission", company_id: 1 },
  {title: "Sales Expert", description: description, role: "Marketing & Sales", location: "Accra", job_type: "Internship", salary: "Unpaid", company_id: 1 },
  {title: "License Manager", description: description, role: "Project Management", location: "Kumasi", job_type: "Full-time", salary: "Paid", company_id: 1 },
  {title: "Agric Officer", description: description, role: "Other", location: "Copenhagen", job_type: "Full-time", salary: "Paid", company_id: 1 },
  {title: "Mathematics Tutor", description: description, role: "Education", location: "Kumasi", job_type: "Full-time", salary: "Paid", company_id: 1 },
  {title: "Mobile Developer", description: description, role: "Software & IT", location: "Copenhagen", job_type: "Full-time", salary: "Paid", company_id: 1 },
]

Job.create!(job_list)

