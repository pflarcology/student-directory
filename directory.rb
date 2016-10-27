
@students = [] # an empty array accessible to all methods

def save_students
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    adding_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
   load_students(filename)
   puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
   puts "Sorry, #{filename} doesn't exist."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items later
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know you meant, try again"
  end
end


def interactive_menu
  load_students()
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  adding_name(name)
end


def adding_name(name)
  while !name.empty? do
    puts "What cohort are they part of?"
    cohort = STDIN.gets.chomp
    adding_students(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def adding_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


def print_header
    puts ("The students of Villains Academy".center(50))
    puts ("-------------".center(50))
end


def print_students_list
  @students.each do |student|
   puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer
    puts("Overall, we have #{@students.count} great students".center(50))
end

try_load_students
interactive_menu
