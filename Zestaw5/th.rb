require_relative 'zadanie1'

p = Przeglader.new
pages = ['http://www.thecamels.org/', 'http://ii.uni.wroc.pl/', 'http://wp.pl/']
threads = []
for page in pages
  threads << Thread.new(page) do |url|
    puts p.page_summary(url)
  end
end
threads.each { |t| t.join}
