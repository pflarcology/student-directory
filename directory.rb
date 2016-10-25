def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "What cohort are they part of?"
    cohort = gets.strip
    if cohort.empty?
      cohort = :november
    elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December" 
      cohort = cohort
    else
    puts "Did you type that correctly?"
      cohort = gets.strip
    end
    students << {name: name, cohort: cohort.to_sym}
    if students.count == 1
      puts "Now we have 1 student"
    else 
      puts "No we have #{students.count} students"
    end
    # get another name from the user
    name = gets.strip
  end
  # return the array of students
  students
end

def print_header
    puts ("The students of Villains Academy".center(50))
    puts ("-------------".center(50))
end

def print(students)
  if students.count > 0
    sorted = students.sort_by { |hsh| hsh[:cohort] }
    sorted.each do |sorted|
      puts "#{sorted[:name]} #{sorted[:cohort]}"
    end
  else
    puts ("There are no students at Villains Academy".center(50))
  end
end

def print_footer(students)
    puts("Overall, we have #{students.count} great students".center(50))
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items later
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know you meant, try again"
    end
  end
end

interactive_menu
