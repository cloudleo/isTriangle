# The Triangle Inequality Theorem states that the sum of any 2 sides
# of a triangle must be greater than the measure of the third side.
# a side cant be 0 or negative

def is_triangle(side1,side2,side3)
  sides = [side1,side2,side3]
  unique_sides = sides.uniq.length
  raise TriangleError if triangle_error_found?(sides)
  type_of_triangle(unique_sides)
end

def type_of_triangle(nous)          #nous stands for number of unique sides
  return 'Equilateral' if nous == 1
  return 'Isosceles' if nous == 2
  return 'Scalene' if nous == 3
end

def triangle_error_found?(sides)
  biggest_side = sides.max
  return true if any_sides_smaller_than_zero?(sides) || bigger_side_valid?(sides,biggest_side)
  return false
end

def any_sides_smaller_than_zero?(sides)
  sides.any? { |side| side <= 0 }
end
 
def bigger_side_valid?(sides,biggest_side)
  sides.inject(:+) - biggest_side < biggest_side 
end

class TriangleError < RuntimeError
end
