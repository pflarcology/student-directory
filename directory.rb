
@students = [] # an empty array accessible to all methods

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items later
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know you meant, try again"
  end
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
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
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have 1 student"
    else 
      puts "No we have #{@students.count} students"
    end
    # get another name from the user
    name = gets.strip
  end
  # return the array of students
  @students
end

def print_header
    puts ("The students of Villains Academy".center(50))
    puts ("-------------".center(50))
end

def print_students_list(students)
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
    puts("Overall, we have #{@students.count} great students".center(50))
end

interactive_menu
