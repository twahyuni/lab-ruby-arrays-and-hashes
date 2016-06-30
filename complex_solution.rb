#
# This is a more complex version where it can handle roster of multiple courses
#
require 'pp'

$roster = {}

def roster
  $roster
end

def show_roster course_name
  key = course_name.to_sym
  if roster.has_key? key
    roster[key]
  else
    []
  end
end

def add_student first_name, last_name, course_name
  student = {
    first_name: first_name,
    last_name: last_name,
    course_name: course_name
  }
  
  course_key = course_name.to_sym
  if roster.has_key? course_key
    roster[course_key] << student
  else
    roster[course_key] = [student]
  end
end

def all_students
  roster.values.flatten.sort { |a,b| a[:last_name] <=> b[:last_name] }.each do |student|
    puts "#{student[:last_name]}, #{student[:first_name]} - #{student[:course_name]}"
  end
end

def students_in_course course_name
  puts "There are #{roster[course_name.to_sym].length} students in our class"
end

def fields_of_student student
  student.keys.each { |field| puts "- #{field}" }
end

## Run the code!

p show_roster "UX Design Immersive"
puts

add_student "Willie", "Tong", "Web Development Immersive"
add_student "Bruce", "Wayne", "UX Design Immersive"
add_student "Clark", "Kent", "Web Development Immersive"
add_student "Barry", "Allen", "UX Design Immersive"
add_student "Oliver", "Queen", "Web Development Immersive"

p show_roster "UX Design Immersive"
puts

p show_roster "Web Development Immersive"
puts

all_students
puts

students_in_course "Web Development Immersive"
puts
students_in_course "UX Design Immersive"
puts

fields_of_student({
  first_name: "Peter",
  last_name: "Parker",
  secret_identity: "Spider-Man",
  major: "Physics",
  course_name: "Introduction to Quantum Physics"
})
puts

fields_of_student roster[:"Web Development Immersive"].first
puts

pp roster

"end of program"