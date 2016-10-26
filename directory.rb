
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


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
   load_students(filename)
   puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
   puts "Sorry, #{filename} doesn't exist."
   exit # quit the program
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
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know you meant, try again"
  end
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
  # create an empty array
  @students = []
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have 1 student"
    else 
      puts "No we have #{@students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
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

try_load_students
interactive_menu
