# zdefiniowane: klucz to wierzcholek a wartość to lista wszystkich sąsiadów

def suma(graf1,graf2)
  wynik = graf1.merge(graf2){ |key, val1, val2| val1 + val2}
  return wynik
end

def suma!(graf1,graf2)
  graf1.merge!(graf2){ |key, val1, val2| val1 + val2}
  return graf1
end

graf1 = { 1 => [2,3], 4 => [5,6]}
graf2 = {3=>[67,7,8]}
graf3 = {1 => [4,5], 8=>[0]}

puts suma(graf1,graf2)
puts suma(graf1,graf3)

puts suma!(graf1,graf2)
puts suma!(graf1,graf3)
