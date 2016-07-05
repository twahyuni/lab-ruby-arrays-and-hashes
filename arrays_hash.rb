# The first method should return either our current list of students, or an empty array if we don't have one yet.

@current_students = []

def list_of_students
  @current_students
end

# The second method should accept data for a new student, create a hash out of the student's information, and add it to a running array of students.
def new_student firstName, lastName, courseName
  student = {
    first_name: firstName,
    last_name: lastName,
    course_name: courseName
  }
  @current_students << student
end

# A third method should read back our list of students we've created in a specific format, sorted by last name
def sorted_list_of_students
  list_of_students.sort_by{ |student| student[:last_name]}.each do |student|
    puts "#{student[:last_name]}, #{student[:first_name]} - #{student[:course_name]}"
  end
end

# A fourth method should display a message about how many students are in the class
def number_of_students
  puts "There are #{list_of_students.count} students in our class"
end

# And a final method should tell us what information any given student hash has in it.
def student_information
  list_of_students.first.keys.each do |attribute|
      puts "- #{attribute}"
  end
end



#initial list
list_of_students

#insert new students
new_student "John", "Doe", "Web Development Immersive"
new_student "Jane", "Zelda", "User Experience Immersive"

#check again
list_of_students

#sort list
sorted_list_of_students

#check how many student
number_of_students

#show student information
student_information

