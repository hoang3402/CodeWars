package kata

func MakeNegative(x int) int {
  if x >= 0 {
    return -x
  }
  return x
}

func MakeNegative(x int) int {
    if x > 0 {
        return -x
    } else {
        return x
    }
}

func MakeNegative(x int) int {
	if x > 0 {
	  x *= -1
	}
	return x
}


import "math"

func MakeNegative(x int) int {
  return -int(math.Abs(float64(x)))
}