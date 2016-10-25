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
    elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December" 
      cohort = cohort
    else
    puts "Did you type that correctly?"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort.to_sym}
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
  sorted = students.sort_by { |hsh| hsh[:cohort] }
  sorted.each do |sorted|
    puts "#{sorted[:name]} #{sorted[:cohort]}"
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