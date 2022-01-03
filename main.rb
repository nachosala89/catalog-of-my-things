class Main
  def present_options
    puts 'Please enter a number to select one of the following options:'
    # Team member 1 options
    # Team member 2 options
  end
end

def main
  main_ui = Main.new
  puts 'Welcome to Catalog of my Things!'
  puts ''
  loop do
    option = main_ui.present_options
    break if option == 0
  end
end

main