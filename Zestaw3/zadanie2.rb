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
  i = 2
  while i <= n
    if pierwsza(i)
      result.push(i)
    end
    i += 1
  end
  return result
end

print pierwsze(15)