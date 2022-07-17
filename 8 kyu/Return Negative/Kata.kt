class Kata {

    fun makeNegative(x: Int): Int {
        if (x > 0) return -x
        else return x
    }
}

class Kata {

    fun makeNegative(x: Int) = if(x <= 0) x else -x
}

import kotlin.math.abs

class Kata {
    fun makeNegative(x: Int) = -abs(x)
}