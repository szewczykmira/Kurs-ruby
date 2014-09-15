def is_number(n)
  retun n.is_a? Numeric
end

def sumuj_liste(n)
  suma = 0
  for elem in n
    suma +=elem
  end
  return suma
end

def suma_list(n)
  wynik = 0
  for lista in n
    wynik += sumuj_liste(lista)
  end
  return wynik
end

puts suma_list([[1,2,3],[4,5]])