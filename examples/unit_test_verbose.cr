require "../src/assert"
require "../src/unit_test"

def square(x)
  x * x
end

unit_test {
  assert square(3) == 4, "Square should be 4"
}

