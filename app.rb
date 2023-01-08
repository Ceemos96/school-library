require './nameable'
require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'
require './student'
require './teacher'
require './person'
require './classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No Books records'
      nil
    else
      @books.map { |book| puts "Title : \"#{book.title}\", Author: \"#{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'No People records'
      nil
    else
      @people.map { |pupil| puts "#{pupil.class} Name: \"#{pupil.name}\", ID: \"#{pupil.id}\", Age: \"#{pupil.age}\"" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    get_option = gets.chomp
    case get_option
    when '1'
      create_student
    when '2'
      create_teacher
    when '3'
      puts 'wrong choice'
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end
    student_creation = Student.new(age, 'student', name, parent_permission: parent_permission)
    @people.push(student_creation)
    puts 'Person created succesfully'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp

    teacher_creation = Teacher.new(age, specialization, name)
    @people.push(teacher_creation)
    puts 'Person created succesfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book_creation = Book.new(title, author)
    @books.push(book_creation)
    puts 'Book created succesfully'
  end

  def create_rental
    if @books.empty?
      puts 'No book records.'
    elsif @people.empty?
      puts 'No person records.'
    else
      puts 'Select a book from the following list by number:'
      @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
      rental_book = gets.chomp.to_i
      puts 'Select a person from the following list by number:'
      @people.each_with_index do |people, index|
        puts "#{index}) Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
      end
      rental_people = gets.chomp.to_i
      puts 'Kindly input the date'
      date = gets.chomp
      rental_summary = Rental.new(date, @people[rental_people], @books[rental_book])
      @rentals.push(rental_summary)
      puts 'Rental created succesfully'
    end
  end

  def rental_from_id
    puts 'Select id of a person'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    puts 'Id of person'
    id = gets.chomp
    @rentals.each do |i|
      puts "Rentals: \n Date: #{i.date}, Book: #{i.book.title}, by #{i.book.author}" if i.person.id.to_i == id.to_i
    end
  end
end
