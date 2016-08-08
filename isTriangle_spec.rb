require 'minitest/autorun'
require_relative 'isTriangle'

class IsTriangleTest < Minitest::Test
  def test_equilateral_with_equal_sides
    assert_equal 'Equilateral', is_triangle(2, 2, 2)
  end

  def test_larger_equilateral_triangles_with_equal_sides
    assert_equal 'Equilateral', is_triangle(10, 10, 10)
  end

  def test_isosceles_triangles_with_two_sides_equal
    assert_equal 'Isosceles', is_triangle(3, 4, 4)
  end

  def test_isosceles_triangles_with_first_and_last_sides_equal
    assert_equal 'Isosceles', is_triangle(4, 3, 4)
  end

  def test_isosceles_triangles_with_two_first_sides_equal
    assert_equal 'Isosceles', is_triangle(4, 4, 3)
  end

  def test_scalene_triangles_with_no_equal_sides
    assert_equal 'Scalene', is_triangle(3, 4, 5)
  end

  def test_large_scalene_triangles_with_no_equal_sides
    assert_equal 'Scalene', is_triangle(10, 11, 12)
  end

  def test_triangles_with_no_sizes
    assert_raises(TriangleError) do
      is_triangle(0, 0, 0)
    end
  end

  def test_triangles_with_negative_sides
    assert_raises(TriangleError) do
      is_triangle(3, 4, -5)
    end
  end

  def test_triangles_with_inequality_theorem
    assert_raises(TriangleError) do
      is_triangle(3, 4, 8)
    end
  end
end