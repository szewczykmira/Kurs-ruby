# zdefiniowane: klucz to wierzcholek a wartość to lista wszystkich sąsiadów

def suma(graf1,graf2)
  wynik = graf1.merge(graf2){ |key, val1, val2| val1 + val2}
end

def suma!(graf1,graf2)
  graf1.merge!(graf2){ |key, val1, val2| val1 + val2}
end

graf1 = { "a" => ["b","c"], "d" => ["e","f"]}
graf2 = {"c"=>["q","t","f"]}
graf3 = {"a" => ["d","e"], "g"=>["l"]}

puts suma(graf1,graf2)
puts suma(graf1,graf3)

puts suma!(graf1,graf2)
puts suma!(graf1,graf3)
