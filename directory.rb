def input_studnets
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is empty, repeat this code
  while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].start_with?('d', 'D')
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_footer(names)
  count = 0 
  names.each do |student|
    if student[:name].start_with?('d', 'D')
      count += 1
    else
    end
  end
  puts "Overall, we have #{count} students"
end

students = input_studnets
print_header
print(students)
print_footer(students)
