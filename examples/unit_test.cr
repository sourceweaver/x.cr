require "../src/assert"
require "../src/unit_test"

def square(x)
  x * x
end

unit_test {
  assert square(2) == 4
  assert square(4) == 16
}

unit_test {
  assert square(3) == 4
}
