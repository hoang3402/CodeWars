# Explanation of logic

## Modulo 9

### Remainders

You can find the remainder of a number by finding the sum of the remainders of each digit, once it has been multiplied by the digit's place value.

Examples:

```
21 % 8 = 5
// 21 consists of (2 × 10), and (1 × 1); i.e. digit × place value
20 % 8 = 4
1 % 8 = 1
// the calculation above gives the same result
1 + 4 = 5
```

```
// a second example with a larger number
48632 % 7 = 3
// or
40000 % 7 = 2
8000 % 7 = 6
600 % 6 = 5
30 % 6 = 2
2 % 7 = 2
2 + 6 + 5 + 2 + 2 = 17
// repeat until a single digit
10 % 7 = 3
7 % 7 = 0
3 + 0 = 3
```

## Why 9?

So, as we use a base 10 number system, a single unit at each place value will always be 1 higher than a multiple of 9. That's tricky to explain, so look at this:

| place value | first value | highest multiple of 9 | remainder |
| ----------- | ----------- | --------------------- | --------- |
| ones        | 1           | 0                     | 1         |
| tens        | 10          | 9                     | 1         |
| hundreds    | 100         | 99                    | 1         |
| thousands   | 1000        | 999                   | 1         |

With this information, we can infer that each digit is equal to its own modulo 9.

Again, consider this for the hundreds place value:

| digit | represented value | highest multiple of nine | modulo 9 |
| ----- | ----------------- | ------------------------ | -------- |
| 1     | 100               | 1 × 99 = 99              | 1        |
| 2     | 200               | 2 × 99 = 198             | 2        |
| 3     | 300               | 3 × 99 = 297             | 3        |
| 4     | 400               | 4 × 99 = 396             | 4        |

Now, with each digit representing its own modulo, and the modulo of a number being equal to the sum of the modulos of each digit (multipled by place value), we can simply do a single modulo 9 operation to calculate the digital root.

# Plus / Minus

If you run `18 % 9` you get a result of 0 but it's pretty intuitive to see that 1 + 8 does not equal 0. So how do we overcome this issue?

### Simple; subtract one before running the modulo and then adding it back on.

Consider `18 % 9`, which we know to have a digital root of 9, but a modulo 9 of 0. If we subtract one before the modulo operation, we know we will be at a remainder of 8, i.e. `(18 - 1) % 9 = 8`. Once the modulo operation has been carried out, adding one back on takes us back to our result, i.e. `((18 - 1) % 9) + 1 = 9`. This prevents a result of 0 from being returned whilst having no effect on any other values, i.e:

```
15 // digital root = 6
15 % 9 = 6 // causes no issue as 0 is not returned
(15 - 1) % 9 = 14 % 9 = 5 // the operation is done anyway so let's see the result
((15 - 1) % 9) + 1 = (14 % 9) + 1 = 5 + 1 = 6 // our original result is unchanged
```
