def pascal(n)
  p=[1]
  while(p.length<=n)
    puts p.join(" ")
    p=Array.new(p.length+1) {|i|
      a=i<p.length ? p[i] : 0
      b=i>0 ? p[i-1] : 0
      a+b}
  end
end

puts pascal(10)