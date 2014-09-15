def say_it(smth)
  number = smth.to_s
  array = number.split('')
  for int in array
    case int
      when '1'
        puts 'jeden'
      when '2'
        puts 'dwa'
      when '3'
        puts 'trzy'
      when '4'
        puts 'cztery'
      when '5'
        puts 'piec'
      when '6'
        puts 'szesc'
      when '7'
        puts 'siedem'
      when '8'
        puts 'osiem'
      when '9'
        puts 'dziewiec'
      when '0'
        puts 'zero'
    end
  end
end

say_it(123)