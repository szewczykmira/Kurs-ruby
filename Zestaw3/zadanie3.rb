def doskonale(n)
  (6..n).select { |j| j == (1...j).select { |i| j % i == 0 }.inject(0) { |sum, i| sum + i }  }
end

print doskonale(28)