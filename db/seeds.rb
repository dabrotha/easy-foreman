# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def is_status_active_randomizer #this function will return 10% of companies to be inactive
  a = rand(10)
    if a < 1
      b = false
    else
      b = true
    end
    return b
end


Company.destroy_all

25.times.each do
  Company.create(
    title: Faker::Company.name,
    description: Faker::DrWho.quote,
    is_status_active: is_status_active_randomizer
  )
end

# puts Cowsay.say "Created #{companies.count} companies", :cows


# Question.destroy_all

# 100.times.each do 
#   Question.create(
#     title: Faker::Simpsons.quote,
#     body: Faker::Hacker.say_something_smart,
#     view_count: rand(0...100_000)
#   )
# end

# questions = Question.all

# puts Cowsay.say "Created #{questions.count} questions", :frogs 



