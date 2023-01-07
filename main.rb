require './app'
class Main
  def self.menu
    puts 'Welcome to the School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '
    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end
    Integer(gets.chomp)
  end
  compile = App.new
  loop do
    case menu
    when 1
      compile.list_books
    when 2
      compile.list_people
    when 3
      compile.create_person
    when 4
      compile.create_book
    when 5
      compile.create_rental
    when 6
      compile.rental_from_id
    when 7
      puts 'Thank you and have a nice day!'
      exit
    else
      puts 'Please choose a number between 1 and 7.'
    end
  end
end

def main
  Main.new
end

main
