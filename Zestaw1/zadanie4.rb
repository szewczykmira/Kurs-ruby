def rozklad(n)
  if n == 1
    return [1]
  end
  czynnik = 2
  temp = []
  while czynnik <= n
    if n % czynnik == 0
      if not temp.member?(czynnik)
        temp.push(czynnik)
      end
      n /= czynnik
    else
      czynnik += 1
    end
  end
  return temp
end

print rozklad(1025)
print rozklad(121)