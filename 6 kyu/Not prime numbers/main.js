// You are given two positive integers a and b (a < b <= 20000). Complete the function which returns a list of all those numbers in the interval [a, b) whose digits are made up of prime numbers (2, 3, 5, 7) but which are not primes themselves.
function notPrimes(a, b) {
    function isPrime(n) {
        for (let i = 2, sqrt = Math.sqrt(n); i <= sqrt; i++)
            if (n % i === 0) return false;
        return n > 1;
    }

    function allDigitsPrime(n) {
        const primeDigits = ['2', '3', '5', '7'];
        return [...String(n)].every(digit => primeDigits.includes(digit));
    }

    const notPrimes = [];
    for (let i = a; i < b; i++) {
        if (!isPrime(i) && allDigitsPrime(i)) {
            notPrimes.push(i);
        }
    }

    return notPrimes;
}

/**
 * Finds all non-prime numbers between two given numbers.
 *
 * @param {number} a - The starting number.
 * @param {number} b - The ending number.
 * @return {array} An array of non-prime numbers.
 */
function notPrimes(a, b) {
    let arr = [];
    for (let i = a; i < b; i++) {
        if (!/[014689]/.test(i)) {
            for (let j = 2; j <= Math.sqrt(i); j++) {
                if (i % j === 0) { arr.push(i); break; }
            }
        }
    }
    return arr;
}