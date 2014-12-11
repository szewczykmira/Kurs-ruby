require 'tk'
class Fractals
  def initialize
    @win = TkRoot.new { title 'Sierpinski triangle'}
    @win['geometry'] = '500x500'
    @canvas = TkCanvas.new(@win) {background 'pink'; pack}
    @height = 400
    @width = 500
    @canvas.place(:height => @height, :width => @width)
    @entry = TkEntry.new(@win) {pack}
    @button = TkButton.new(@win) {text 'Display'; pack}
    @button.command { self.display }
    Tk.mainloop
  end
  def display
    @canvas.delete('all')
    p1 = [@width/2, 10]
    p2 = [10, @height-10]
    p3 = [@width-10, @height-10]
    self.display_triangles(eval(@entry.value).to_i, p1, p2, p3)
  end
  def display_triangles(order, p1, p2, p3)
    if order == 0
      @canvas.create(TkcLine, p1, p2)
      @canvas.create(TkcLine, p2, p3)
      @canvas.create(TkcLine, p3, p1)
    else
      p12 = self.midpoint(p1, p2)
      p23 = self.midpoint(p2, p3)
      p13 = self.midpoint(p1, p3)

      #rysowanie rekurencyjne trójkątów
      self.display_triangles(order-1, p1, p12, p13)
      self.display_triangles(order-1, p12, p2, p23)
      self.display_triangles(order-1, p13, p23, p3)
    end
  end
  def midpoint(p1,p2)
    p = []
    p[0] = (p1[0] + p2[0]) / 2
    p[1] = (p1[1] + p2[1]) / 2
    return p
  end
end

Fractals.new.run
