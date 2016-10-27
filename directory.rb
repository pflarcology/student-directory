
@students = [] # an empty array accessible to all methods
require 'csv'

def save_students(filename)
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, "r") do |row|
      name, cohort = row[0], row[1]
      adding_students(name, cohort)
  end
end

def choose_file
  puts "Which file?"
  filename = gets.chomp
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
  puts "3. Save the list to a file of your choosing"
  puts "4. Load the list from a file of your choosing"
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
      selection_successful(selection)
      input_students
    when "2"
      selection_successful(selection)
      show_students
    when "3"
      selection_successful(selection)
      save_students(choose_file)
    when "4"
      selection_successful(selection)
      load_students(choose_file)
    when "9"
      selection_successful(selection)
      exit
    else
      puts "I don't know you meant, try again"
  end
end

def selection_successful(b)
  puts "You have successfully chosen menu option #{b}."
end

def interactive_menu
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
