# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  sides = [a,b,c]
  validate_sides(sides)

  unique_side_lengths = sides.uniq.length

  case unique_side_lengths
  when 1
    :equilateral
  when 2
    :isosceles
  when 3
    :scalene
  end
end

def validate_sides(sides)
  # Check if any sides are 0 or negative
  sides.each do |s|
    if s <= 0
      raise TriangleError, 'Invalid Triangle side length'
    end
  end

  # Ensure that they could form a triangle  
  unless sides_can_form_triangle(sides)
    raise TriangleError, 'Invalid Triangle sides: cannot form triangle' 
  end
end

def sides_can_form_triangle(sides)

  a, b, max = sides.sort

  max < a + b

end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
