def pierwsza(n)
  _czynnik =2
  while _czynnik <= Math.sqrt(n)
    if n%_czynnik == 0
      return false
    else
      _czynnik += 1
    end
  end
  return true
end

def pierwsze(n)
  result = []
  (2..n).each do |i|
    if pierwsza(i)
      result.push(i)
    end
  end
  return result
end

print pierwsze(15)