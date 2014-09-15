def zapisz(n)
  case n
    when 'jeden'
      return 1
    when 'dwa'
      return 2
    when 'trzy'
      return 3
    when 'cztery'
      return 4
    when 'piec'
      return 5
    when 'szesc'
      return 6
    when 'siedem'
      retunr 7
    when 'osiem'
      return 8
    when 'dziewiec'
      return 9
    when 'zero'
      return 0
  end
end


def write_it(string)
  wynik = 0
  for number in string
    wynik = wynik*10 + zapisz(number)
  end
  return wynik
end

x = write_it(['jeden','dwa','trzy', 'zero'])
puts x