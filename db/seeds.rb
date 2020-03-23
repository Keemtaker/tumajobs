# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# p "destroying perks"
Perk.destroy_all

p "Creating Perks"

perk_list = [
  {name: "Catering", icon: "fas fa-utensils fa-3x" },
  {name: "Skill Development", icon: "far fa-star fa-3x" },
  {name: "Flexible Work Hours", icon: "far fa-clock fa-3x" },
  {name: "Career Progression", icon: "fab fa-black-tie fa-3x" },
  {name: "Work life balance", icon: "fas fa-balance-scale fa-3x" },
  {name: "Health Insurance", icon: "fas fa-heartbeat fa-3x" },
  {name: "Games & Hangouts", icon: "fas fa-gamepad fa-3x" },
  {name: "Occasional Remote Work", icon: "fas fa-globe fa-3x" },
  {name: "Paid Vacation", icon: "fas fa-plane fa-3x" },
  {name: "Pension Plan", icon: "fas fa-home fa-3x" },
  {name: "Performance Bonus", icon: "far fa-money-bill-alt fa-3x" },
  {name: "Free Coffee", icon: "fas fa-coffee fa-3x" },
  {name: "Parental Leave", icon: "fas fa-baby fa-3x" },
  {name: "Friday Bars", icon: "fa fa-beer fa-3x" },
  {name: "Gym Membership", icon: "fas fa-running fa-3x" },
]

Perk.create!(perk_list)

