require 'prime'
def pierwsze(n)
  [2]+(3..n).select{|x| (2..Math.sqrt(x).ceil).each{|j| x%j==0 ? break : j}}
end

print pierwsze(15)