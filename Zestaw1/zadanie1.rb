def slownie(n)
  jednosci = { 0 => '',
               1 => 'jeden',
               2 => 'dwa',
               3 => 'trzy',
               4 => 'cztery',
               5 => 'piec',
               6 => 'szesc',
               7 => 'siedem',
               8 => 'osiem',
               9 => 'dziewiec'}
  nastki = { 10 => 'dziesiec',
             11 => 'jedenascie',
             12 => 'dwanascie',
             13 => 'trzynascie',
             14 => 'czternascie',
             15 => 'pietnascie',
             16 => 'szesnascie',
             17 => 'siedemnascie',
             18 => 'osiemnascie',
             19 => 'dziewietnascie'}
  dziesiatki = { 2 => 'dwadziescia ',
                 3 => 'trzydziesci ',
                 4 => 'czterdziesci ',
                 5 => 'piecdziesiat ',
                 6 => 'szescdziesiat ',
                 7 => 'siedemdziesiat ',
                 8 => 'osiemdziesiat ',
                 9 => 'dziewiecdziesiat '}
  setki = { 1 => 'sto ',
            2 => 'dwiescie ',
            3 => 'trzysta ',
            4 => 'czterysta ',
            5 => 'piecset ',
            6 => 'szescset ',
            7 => 'siedemset ',
            8 => 'osiemset ',
            9 => 'dziewiecset '}

  number = n
  wynik = ''
  if number / 1000 != 0
    decimal = number / 1000
    number = number % 1000
    if decimal == 1
      wynik += 'tysiac '
    elsif decimal <= 4
      temp = jednosci[decimal] + ' tysiace '
      wynik += temp
    else
      temp = jednosci[decimal] + ' tysiecy '
      wynik += temp
    end
  end

  if number / 100 != 0
    decimal = number / 100
    number = number % 100
    wynik += setki[decimal]
  end
  if number < 10
    wynik += jednosci[number]
  end
  if number / 10 == 1
    decimal = number % 100
    wynik += nastki[decimal]
  end
  if number / 10 > 1
    decimal = number / 10
    number = number % 10
    temp = dziesiatki[decimal] + jednosci[number]
    wynik += temp
  end
  return wynik
end

puts slownie(1)
puts slownie(11)
puts slownie(23)
puts slownie(34)
puts slownie(653)
puts slownie(9876)