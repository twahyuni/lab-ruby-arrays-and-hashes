@students = []

#The first method should return either our current list of students, or an empty array if we don't have one yet.
def students
  @students
end

#The second method should accept data for a new student, create a hash out of the student's information, and add it to a running array of students.

def add_student first_name, last_name, course_name
  student = {
    first_name: first_name,
    last_name: last_name,
    course_name: course_name
  }
  students << student
end

#A third method should read back our list of students we've created in a specific format, sorted by last name
def list_students
  students.sort_by { |student| student[:last_name] }.each do |student|
    puts "#{student[:last_name]}, #{student[:first_name]} - #{student[:course_name]}"
  end
end

#A fourth method should display a message about how many students are in the class
def count_students
  puts "We have #{students.length} in our course"
end

#And a final method should tell us what information any given student hash has in it.
def student_details
  students.first.keys.each do |attribute|
    puts "- #{attribute}"
  end
end