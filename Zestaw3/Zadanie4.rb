__author__ = "Mira"
def rozklad(n)
  if n < 1
    return [n]
  end
  _czynnik = 2
  temp = []
  zliczacz = 0
  while _czynnik <= n
    if n % _czynnik == 0
      zliczacz +=1
      n /= _czynnik
    else
      if zliczacz != 0
        temp.push([_czynnik, zliczacz])
        zliczacz = 0
      end
      _czynnik += 1
    end
  end
  temp.push([[_czynnik, zliczacz]])
end


print rozklad(756)
