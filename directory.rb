def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "What cohort are they part of?"
    cohort = gets.chomp
    if cohort == ""
      cohort = :november
    else 
      cohort.downcase.to_sym
    end
    puts "What about their country of birth?"
    cob = gets.chomp
    puts "And most importantly, what's their height?"
    height = gets.chomp
    students << {name: name, cohort: cohort, height: height, cob: cob}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts ("The students of Villains Academy".center(50))
  puts ("-------------".center(50))
end

def print(students)
  count = 0
  total = students.size
  while count < total
    puts ("#{count+1} #{students[count][:name]} #{students[count][:cohort]} #{students[count][:height]}".center(50))
    count += 1
  end
end

def print_footer(students)
  puts("Overall, we have #{students.count} great students".center(50))
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)