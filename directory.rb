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
    if cohort.empty?
      cohort = :november
    elsif cohort = "January" || "February" || "March" || "April" || "May" || "June" || "July" || "August" || "September" || "October" || "November" || "December" 
      puts "Did you tupe that correctly?"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort.downcase.to_sym}
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
  students.sort_by do |student|
    student[:cohort]
    puts "#{student[:name]} (#{student[:cohort]} cohort)."
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