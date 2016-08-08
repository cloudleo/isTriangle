# The Triangle Inequality Theorem states that the sum of any 2 sides
# of a triangle must be greater than the measure of the third side.
# a side cant be 0 or negative

def is_triangle(side1,side2,side3)
  sides = [side1,side2,side3]
  biggest_side = sides.max
  sides.each do |side|
    if side <= 0
     raise TriangleError
    end
  end
  raise TriangleError if sides.inject(:+) - biggest_side < biggest_side
  return 'Equilateral' if sides.uniq.length == 1
  return 'Isosceles' if sides.uniq.length == 2
  return 'Scalene' if sides.uniq.length == 3
end

class TriangleError < RuntimeError
end
